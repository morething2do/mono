# 快速开始指南

本指南将帮助你快速启动和运行整个 Monorepo 项目。

## 1. 环境准备

### 1.1 安装 Bun
```bash
curl -fsSL https://bun.sh/install | bash
```

### 1.2 安装 uv (Python 包管理器)
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### 1.3 安装 Rust (用于 Tauri)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## 2. 安装项目依赖

```bash
# 克隆项目后，进入项目根目录
cd monorepo

# 安装所有 JavaScript/TypeScript 依赖
bun install

# 安装 Python 依赖
cd apps/api && uv sync && cd ../..
```

## 3. 启动开发服务器

### 方式一：一键启动所有服务
```bash
bun run dev
```

这将同时启动：
- API 服务（端口 8000）
- Web 前端（端口 5173）
- Desktop 应用（Tauri 窗口）

### 方式二：单独启动服务

#### 启动 API 服务
```bash
cd apps/api
bun run dev
```
访问: http://localhost:8000
API 文档: http://localhost:8000/docs

#### 启动 Web 前端
```bash
cd apps/web
bun run dev
```
访问: http://localhost:5173

#### 启动桌面应用
```bash
cd apps/desktop
bun run dev
```

## 4. 测试 CLI 工具

```bash
cd packages/cli

# 显示项目信息
bun run dev info

# 测试问候命令
bun run dev hello "开发者"

# 检查 API 状态（确保 API 服务已启动）
bun run dev api

# 获取数据项
bun run dev items
```

## 5. 项目功能体验

### 5.1 Web Dashboard
1. 访问 http://localhost:5173
2. 查看统计卡片
3. 查看图表（用户增长、收入分析）
4. 查看数据表格
5. 尝试切换侧边栏

### 5.2 API 服务
1. 访问 http://localhost:8000/docs
2. 测试 `/api/health` 接口
3. 测试 `/api/items` CRUD 操作
4. 查看自动生成的 API 文档

### 5.3 桌面应用
1. 运行 `cd apps/desktop && bun run dev`
2. 桌面窗口将自动打开
3. 显示与 Web 应用相同的界面
4. 享受原生应用体验

## 6. 构建生产版本

### 构建所有项目
```bash
bun run build
```

### 单独构建

#### Web 前端
```bash
cd apps/web
bun run build
# 输出在 .svelte-kit/output/
```

#### CLI 工具
```bash
cd packages/cli
bun run build
# 输出在 dist/
```

#### 桌面应用
```bash
cd apps/desktop
bun run build
# 安装包在 src-tauri/target/release/bundle/
```

## 7. 常见问题

### Q: API 服务启动失败
A: 确保 Python 依赖已安装：
```bash
cd apps/api
uv sync
```

### Q: Web 前端启动失败
A: 确保依赖已安装：
```bash
cd apps/web
bun install
```

### Q: Tauri 构建失败
A: 确保 Rust 工具链已安装：
```bash
rustc --version
cargo --version
```

### Q: 如何清理项目
A: 运行清理命令：
```bash
bun run clean
```

## 8. 开发技巧

### 8.1 使用 Turborepo 缓存
Turborepo 会自动缓存构建结果，加速后续构建。

### 8.2 热重载
所有项目都支持热重载：
- Python: uvicorn 自动重载
- Svelte: Vite 热模块替换
- Tauri: 自动重新编译

### 8.3 类型检查
```bash
bun run type-check
```

### 8.4 代码格式化
```bash
bun run format
```

## 9. 下一步

- 阅读 [README.md](../README.md) 了解更多详情
- 查看 [CONTRIBUTING.md](../CONTRIBUTING.md) 了解贡献指南
- 探索各个项目的 README 文件

## 10. 获取帮助

如果遇到问题，请：
1. 查看项目文档
2. 提交 Issue
3. 查看相关技术栈的官方文档

祝你开发愉快！🚀
