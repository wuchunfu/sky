package router

import (
	"sky/app/system/v1/apis"

	"github.com/gin-gonic/gin"
)

func ApiRouter(g *gin.RouterGroup) {
	router := g.Group("/api")
	{
		router.GET("", apis.ApiList)
		router.POST("", apis.SaveApi)
		router.DELETE("/:id", apis.DeleteApi)
	}
}
