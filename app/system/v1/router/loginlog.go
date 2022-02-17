package router

import (
	"sky/app/system/v1/apis"

	"github.com/gin-gonic/gin"
)

func LoginLogRouter(g *gin.RouterGroup) {
	router := g.Group("/login-log")
	{
		router.GET("", apis.LoginLogList)
		router.DELETE("/:id", apis.DeleteLoginLog)
	}
}
