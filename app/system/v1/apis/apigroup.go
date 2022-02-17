package apis

import (
	"sky/app/system/models"
	"sky/pkg/db"
	"sky/pkg/pagination"
	"sky/pkg/tools/response"

	"github.com/gin-gonic/gin"
)

// ApiGroupList 接口分组列表
func ApiGroupList(c *gin.Context) {
	var (
		err          error
		apiGroupList []*models.ApiGroup
		result       interface{}
	)

	SearchParams := map[string]map[string]interface{}{
		"like": pagination.RequestParams(c),
	}

	result, err = pagination.Paging(&pagination.Param{
		C:  c,
		DB: db.Orm.Model(&models.ApiGroup{}).Order("id"),
	}, &apiGroupList, SearchParams)
	if err != nil {
		response.Error(c, err, response.ApiGroupListError)
		return
	}
	response.OK(c, result, "")
}

// SaveApiGroup 保存接口分组
func SaveApiGroup(c *gin.Context) {
	var (
		err           error
		apiGroup      models.ApiGroup
		apiGroupCount int64
	)

	err = c.ShouldBind(&apiGroup)
	if err != nil {
		response.Error(c, err, response.InvalidParameterError)
		return
	}

	dbModels := db.Orm.Model(&models.ApiGroup{})

	if apiGroup.Id != 0 {
		dbModels = dbModels.Where("id = ?", apiGroup.Id)
	} else {
		err = db.Orm.Model(&models.ApiGroup{}).
			Where(`"name" = ?`, apiGroup.Name).
			Count(&apiGroupCount).Error
		if err != nil {
			response.Error(c, err, response.ApiGroupExistError)
			return
		}
	}

	err = dbModels.Save(&apiGroup).Error
	if err != nil {
		response.Error(c, err, response.SaveApiGroupError)
		return
	}

	response.OK(c, "", "")
}

// DeleteApiGroup 删除接口分组
func DeleteApiGroup(c *gin.Context) {
	var (
		err        error
		apiCount   int64
		apiGroupId string
	)

	apiGroupId = c.Param("id")

	err = db.Orm.Model(&models.Api{}).Where(`"group" = ?`, apiGroupId).Count(&apiCount).Error
	if err != nil {
		response.Error(c, err, response.GetApiError)
		return
	}
	if apiCount > 0 {
		response.Error(c, err, response.ApiGroupUsedError)
		return
	}

	err = db.Orm.Delete(&models.ApiGroup{}, apiGroupId).Error
	if err != nil {
		response.Error(c, err, response.DeleteApiGroupError)
		return
	}

	response.OK(c, "", "")
}
