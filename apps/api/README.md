# API 服务

基于 FastAPI 和 uv 的现代化 Python 后端服务。

## 技术栈

- **FastAPI**: 现代化的异步 Web 框架
- **uv**: 超快的 Python 包管理器
- **Pydantic**: 数据验证和设置管理
- **Uvicorn**: ASGI 服务器

## 开发

```bash
# 安装依赖
uv sync

# 启动开发服务器（热重载）
uv run dev

# 或者使用 turbo
bun dev --filter=api
```

## API 文档

启动服务后访问：
- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## 测试

```bash
uv run pytest
```

## 项目结构

```
api/
├── api/
│   ├── __init__.py
│   ├── main.py          # 主应用入口
│   └── routers/         # 路由模块
│       ├── health.py    # 健康检查
│       └── items.py     # 数据项 CRUD
├── pyproject.toml       # 项目配置
└── package.json         # Turborepo 集成
```
