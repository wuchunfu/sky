package router

import (
	"net/http"
	v1 "sky/common/router/v1"
	"sky/pkg/logger"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/pprof"
	"github.com/gin-gonic/gin"
)

// Setup 加载路由
func Setup(g *gin.Engine) {
	// 使用zap接收gin框架默认的日志并配置
	g.Use(logger.GinLogger(), logger.GinRecovery(true))

	// 404
	g.NoRoute(func(c *gin.Context) {
		c.String(http.StatusNotFound, "404 页面不存在")
	})

	// pprof router
	pprof.Register(g)

	// cors， 跨域
	config := cors.Config{
		AllowMethods:     []string{"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD"},
		AllowHeaders:     []string{"Origin", "Content-Length", "Content-Type"},
		AllowOrigins:     []string{"*"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}
	g.Use(cors.New(config))

	// 路由版本
	v1.RegisterRouter(g.Group("/sky/api/v1"))
}
