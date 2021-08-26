package models

import (
	"sky/common/models"

	"github.com/lib/pq"
)

type Menu struct {
	Path        string         `gorm:"column:path;type:varchar(200);comment:路径" json:"path"`
	Name        string         `gorm:"column:name;type:varchar(100);comment:路由名称" json:"name"`
	Component   string         `gorm:"column:component;type:varchar(200);comment:组件路径" json:"component"`
	Title       string         `gorm:"column:title;type:varchar(200);comment:标题" json:"title"`
	IsLink      string         `gorm:"column:is_link;type:varchar(200);comment:是否超链接" json:"isLink"`
	IsHide      bool           `gorm:"column:is_hide;type:boolean;comment:是否隐藏" json:"isHide"`
	IsKeepAlive bool           `gorm:"column:is_keep_alive;type:boolean;comment:是否缓存组件状态" json:"isKeepAlive"`
	IsAffix     bool           `gorm:"column:is_affix;type:boolean;comment:是否固定在 tagsView 栏上" json:"isAffix"`
	IsIframe    bool           `gorm:"column:is_iframe;type:boolean;comment:是否内嵌窗口" json:"isIframe"`
	Auth        pq.StringArray `gorm:"column:auth;type:varchar(50)[];comment:权限标识" json:"auth"`
	Icon        string         `gorm:"column:icon;type:varchar(200);comment:图标" json:"icon"`
	Parent      int            `gorm:"column:parent;type:integer;comment:父级" json:"parent"`
	Type        int            `gorm:"column:type;type:smallint;comment:类型" json:"type"` // 1 菜单，2 按钮
	models.BaseModel
}

type MenuValue struct {
	Id        int    `json:"-"`
	Path      string `json:"path"`
	Name      string `json:"name"`
	Component string `json:"component"`
	Parent    int    `json:"-"`
	Meta      struct {
		Title       string   `json:"title"`
		IsLink      string   `json:"isLink"`
		IsHide      bool     `json:"isHide"`
		IsKeepAlive bool     `json:"isKeepAlive"`
		IsAffix     bool     `json:"isAffix"`
		IsIframe    bool     `json:"isIframe"`
		Auth        []string `json:"auth"`
		Icon        string   `json:"icon"`
	} `json:"meta"`
	Children []*MenuValue `json:"children"`
}

func (Menu) TableName() string {
	return "system_menu"
}

type MenuTree struct {
	Menus       []*Menu
	ParentMenus map[int][]*MenuValue
}

func (m *MenuTree) formatMenus(menuValueList []*MenuValue) {
	m.ParentMenus = make(map[int][]*MenuValue)
	for _, menu := range menuValueList {
		if menu.Parent != 0 {
			if _, ok := m.ParentMenus[menu.Parent]; ok {
				m.ParentMenus[menu.Parent] = append(m.ParentMenus[menu.Parent], menu)
			} else {
				m.ParentMenus[menu.Parent] = []*MenuValue{menu}
			}
		}
	}
}

func (m *MenuTree) recursionMenuTree(menus []*MenuValue) {
	for _, menu := range menus {
		if _, ok := m.ParentMenus[menu.Id]; ok {
			menu.Children = m.ParentMenus[menu.Id]
			m.recursionMenuTree(menu.Children)
		}
	}
}

func (m *MenuTree) GetMenuTree() []*MenuValue {
	var (
		topMenuList   []*MenuValue
		menuValueList []*MenuValue
	)

	topMenuList = make([]*MenuValue, 0)
	for _, menu := range m.Menus {
		menuValue := &MenuValue{
			Id:        menu.Id,
			Path:      menu.Path,
			Name:      menu.Name,
			Component: menu.Component,
			Parent:    menu.Parent,
			Meta: struct {
				Title       string   `json:"title"`
				IsLink      string   `json:"isLink"`
				IsHide      bool     `json:"isHide"`
				IsKeepAlive bool     `json:"isKeepAlive"`
				IsAffix     bool     `json:"isAffix"`
				IsIframe    bool     `json:"isIframe"`
				Auth        []string `json:"auth"`
				Icon        string   `json:"icon"`
			}{
				Title:       menu.Title,
				IsLink:      menu.IsLink,
				IsHide:      menu.IsHide,
				IsKeepAlive: menu.IsKeepAlive,
				IsAffix:     menu.IsAffix,
				IsIframe:    menu.IsIframe,
				Auth:        menu.Auth,
				Icon:        menu.Icon,
			},
			Children: nil,
		}
		menuValueList = append(menuValueList, menuValue)
		if menu.Parent == 0 {
			topMenuList = append(topMenuList, menuValue)
		}
	}

	m.formatMenus(menuValueList)

	m.recursionMenuTree(topMenuList)
	return topMenuList
}