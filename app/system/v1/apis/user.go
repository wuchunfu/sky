package apis

import (
	"sky/app/system/models"
	"sky/common/middleware/permission"
	"sky/pkg/db"
	"sky/pkg/pagination"
	"sky/pkg/tools/response"

	"golang.org/x/crypto/bcrypt"

	"github.com/gin-gonic/gin"
)

// UserList 用户列表
func UserList(c *gin.Context) {
	var (
		err      error
		userList []*models.User
		result   interface{}
	)

	SearchParams := map[string]map[string]interface{}{
		"like": pagination.RequestParams(c),
	}

	result, err = pagination.Paging(&pagination.Param{
		C:  c,
		DB: db.Orm.Model(&models.User{}),
	}, &userList, SearchParams)
	if err != nil {
		response.Error(c, err, response.UserListError)
		return
	}

	response.OK(c, result, "")
}

// UserInfo 用户详情
func UserInfo(c *gin.Context) {
	var (
		err  error
		user struct {
			models.User
			Page   []string `gorm:"-" json:"page"`
			Button []string `gorm:"-" json:"button"`
		}
		groups  [][]string
		roleIds []int
	)

	err = db.Orm.Model(&models.User{}).Where("username = ?", c.GetString("username")).Scan(&user).Error
	if err != nil {
		response.Error(c, err, response.GetUserInfoError)
		return
	}

	groups = permission.Enforcer.GetFilteredNamedGroupingPolicy("g", 0, user.Username)
	if len(groups) > 0 {
		roles := make([]string, 0, len(groups))
		for _, g := range groups {
			roles = append(roles, g[1])
		}
		user.Role = roles
	}

	if !user.IsAdmin {
		// 查询角色ID
		err = db.Orm.Model(&models.Role{}).Where("key in (?)", user.Role).Pluck("id", &roleIds).Error
		if err != nil {
			response.Error(c, err, response.GetRoleError)
			return
		}

		// 查询菜单权限
		err = db.Orm.Debug().Model(&models.RoleMenu{}).
			Joins("left join system_menu on system_menu.id = system_role_menu.menu").
			Select("distinct UNNEST(system_menu.auth) as auth").
			Where(`system_role_menu.role in (?) and system_role_menu."type" = 1`, roleIds).
			Pluck("auth", &user.Page).
			Error
		if err != nil {
			response.Error(c, err, response.GetRoleMenuError)
			return
		}

		// 查询按钮权限
		err = db.Orm.Debug().Model(&models.RoleMenu{}).
			Joins("left join system_menu on system_menu.id = system_role_menu.menu").
			Select("distinct UNNEST(system_menu.auth) as auth").
			Where(`system_role_menu.role in (?) and system_role_menu."type" = 2`, roleIds).
			Pluck("auth", &user.Button).
			Error
		if err != nil {
			response.Error(c, err, response.GetRoleMenuError)
			return
		}
	} else {
		user.Page = []string{}
		user.Button = []string{}
	}
	response.OK(c, user, "")
}

// UserInfoById 通过ID获取用户详情
func UserInfoById(c *gin.Context) {
	var (
		err    error
		user   models.User
		groups [][]string
		userId string
	)

	userId = c.Param("id")

	err = db.Orm.Model(&models.User{}).Where("id = ?", userId).Find(&user).Error
	if err != nil {
		response.Error(c, err, response.GetUserInfoError)
		return
	}

	groups = permission.Enforcer.GetFilteredNamedGroupingPolicy("g", 0, user.Username)
	if len(groups) > 0 {
		roles := make([]string, 0, len(groups))
		for _, g := range groups {
			roles = append(roles, g[1])
		}
		user.Role = roles
	}

	response.OK(c, user, "")
}

// CreateUser 创建用户
func CreateUser(c *gin.Context) {
	var (
		err       error
		user      models.UserRequest
		userCount int64
		password  []byte
		groups    [][]string
	)

	err = c.ShouldBind(&user)
	if err != nil {
		response.Error(c, err, response.InvalidParameterError)
		return
	}

	// 判断用户是否存在
	err = db.Orm.Model(&models.User{}).Where("username = ?", user.Username).Count(&userCount).Error
	if err != nil {
		response.Error(c, err, response.QueryUserError)
		return
	}
	if userCount > 0 {
		response.Error(c, err, response.UserExistError)
		return
	}

	// 加密密码
	password, err = bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		response.Error(c, err, response.EncryptPasswordError)
		return
	}

	user.Password = string(password)

	// 创建用户
	tx := db.Orm.Begin()
	err = tx.Create(&user).Error
	if err != nil {
		tx.Rollback()
		response.Error(c, err, response.CreateUserError)
		return
	}

	if len(user.Role) > 0 {
		for _, role := range user.Role {
			groups = append(groups, []string{user.Username, role})
		}
		_, err = permission.Enforcer.AddNamedGroupingPolicies("g", groups)
		if err != nil {
			tx.Rollback()
			response.Error(c, err, response.CreateUserRoleError)
			return
		}
	}

	tx.Commit()

	response.OK(c, "", "")
}

// UpdateUser 更新用户
func UpdateUser(c *gin.Context) {
	var (
		err           error
		userId        string
		user          models.User
		groups        [][]string
		currentGroups [][]string
		groupMap      map[string]struct{}
		deleteGroups  [][]string
		createGroups  [][]string
	)

	userId = c.Param("id")

	err = c.ShouldBind(&user)
	if err != nil {
		response.Error(c, err, response.InvalidParameterError)
		return
	}

	// 更新用户
	tx := db.Orm.Begin()
	err = tx.Model(&models.User{}).Omit("password").Where("id = ?", userId).Save(&user).Error
	if err != nil {
		tx.Rollback()
		response.Error(c, err, response.UpdateUserError)
		return
	}

	groupMap = make(map[string]struct{})
	for _, role := range user.Role {
		groups = append(groups, []string{user.Username, role})
		groupMap[role] = struct{}{}
	}

	// 查询现有的角色关联
	deleteGroups = make([][]string, 0)
	currentGroups = permission.Enforcer.GetFilteredNamedGroupingPolicy("g", 0, user.Username)
	for _, g := range currentGroups {
		if _, ok := groupMap[g[1]]; !ok {
			deleteGroups = append(deleteGroups, g)
			delete(groupMap, g[1])
		}
	}

	if len(deleteGroups) > 0 {
		// 删除用户角色关联
		_, err = permission.Enforcer.RemoveNamedGroupingPolicies("g", deleteGroups)
		if err != nil {
			tx.Rollback()
			response.Error(c, err, response.DeleteUserRoleError)
			return
		}
	}

	if len(groupMap) > 0 {
		createGroups = make([][]string, 0)
		for k, _ := range groupMap {
			createGroups = append(deleteGroups, []string{user.Username, k})
		}

		// 保存用户角色关联
		_, err = permission.Enforcer.AddNamedGroupingPolicies("g", createGroups)
		if err != nil {
			tx.Rollback()
			response.Error(c, err, response.CreateUserRoleError)
			return
		}
	}
	tx.Commit()

	response.OK(c, "", "")
}

// DeleteUser 删除用户
func DeleteUser(c *gin.Context) {
	var (
		err    error
		userId string
		user   models.User
	)

	userId = c.Param("id")

	err = db.Orm.Model(&models.User{}).Where("id = ?", userId).Find(&user).Error
	if err != nil {
		response.Error(c, err, response.GetUserInfoError)
		return
	}

	groups := permission.Enforcer.GetFilteredNamedGroupingPolicy("g", 0, user.Username)
	if len(groups) > 0 {
		response.Error(c, err, response.UserRoleError)
		return
	}

	err = db.Orm.Delete(&models.User{}, userId).Error
	if err != nil {
		response.Error(c, err, response.DeleteUserError)
		return
	}

	response.OK(c, "", "")
}
