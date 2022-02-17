package router

import (
	"sky/app/system/v1/apis"

	"github.com/gin-gonic/gin"
)

/*
  @Author : lanyulei
*/

func UserRouter(g *gin.RouterGroup) {
	router := g.Group("/user")
	{
		router.GET("", apis.UserList)
		router.GET("/info", apis.UserInfo)
		router.GET("/info/:id", apis.UserInfoById)
		router.POST("", apis.CreateUser)
		router.PUT("/:id", apis.UpdateUser)
		router.DELETE("/:id", apis.DeleteUser)
	}
}
