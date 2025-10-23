"""FastAPI 主应用入口"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api.routers import health, items

app = FastAPI(
    title="API 服务",
    description="基于 FastAPI 的后端服务",
    version="0.1.0",
)

# CORS 配置
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 生产环境应该设置具体的域名
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 注册路由
app.include_router(health.router, prefix="/api", tags=["健康检查"])
app.include_router(items.router, prefix="/api", tags=["数据项"])


@app.get("/")
async def root():
    """根路径"""
    return {
        "message": "欢迎使用 API 服务",
        "docs": "/docs",
        "redoc": "/redoc",
    }
