package v1

import (
	"sky/common/router/v1/routers"

	"github.com/gin-gonic/gin"
)

/*
  @Author : lanyulei
  @Desc :
*/

func RegisterRouter(g *gin.RouterGroup) {
	// 公共接口路由，非业务相关路由
	routers.RegisterPublicRouter(g)

	// 系统管理
	routers.RegisterSystemRouter(g)
}
