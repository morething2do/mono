# Monorepo 项目模板

一个功能完整的 Monorepo 项目模板，集成了 Python FastAPI、Svelte、CLI 工具和 Tauri 桌面应用。

## 🏗️ 项目结构

```
monorepo/
├── apps/
│   ├── api/          # Python FastAPI 后端服务（使用 uv 管理）
│   ├── web/          # Svelte + ShadCN 前端应用（使用 bun）
│   └── desktop/      # Tauri 2.0 桌面应用（使用 Rust）
├── packages/
│   └── cli/          # CLI 工具（使用 bun + TypeScript）
├── package.json      # 根配置（使用 bun workspaces）
└── turbo.json        # Turborepo 配置
```

## 🚀 技术栈

### 后端 API
- **语言**: Python 3.12+
- **框架**: FastAPI
- **包管理**: uv
- **特性**: RESTful API、CORS、路由分离

### 前端应用
- **框架**: Svelte 5 + SvelteKit
- **UI 库**: shadcn-svelte
- **样式**: Tailwind CSS
- **图表**: Chart.js + svelte-chartjs
- **包管理**: bun
- **特性**: Dashboard、侧边栏、图表、数据表格

### CLI 工具
- **运行时**: Bun
- **语言**: TypeScript
- **CLI 框架**: Commander.js
- **特性**: 彩色输出、加载动画、API 交互

### 桌面应用
- **框架**: Tauri 2.0
- **语言**: Rust
- **前端**: 集成 Web 应用
- **特性**: 跨平台、小体积、高性能

### Monorepo 管理
- **包管理**: bun (替代 npm/yarn)
- **任务运行**: Turborepo
- **工作区**: bun workspaces

## 📦 安装

### 前置条件

1. **Bun** (>= 1.0.0)
```bash
curl -fsSL https://bun.sh/install | bash
```

2. **Python** (>= 3.12)
```bash
# 已经在系统中安装
```

3. **uv** (Python 包管理器)
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

4. **Rust** (用于 Tauri)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### 安装依赖

```bash
# 安装所有依赖
bun install

# 安装 Python 依赖
cd apps/api && uv sync
```

## 🛠️ 开发

### 启动所有服务

```bash
# 使用 Turborepo 并行启动所有服务
bun run dev
```

### 单独启动服务

#### API 服务
```bash
cd apps/api
bun run dev
# 访问 http://localhost:8000
# API 文档: http://localhost:8000/docs
```

#### Web 前端
```bash
cd apps/web
bun run dev
# 访问 http://localhost:5173
```

#### CLI 工具
```bash
cd packages/cli
bun run dev

# 或使用命令
bun run src/index.ts info
bun run src/index.ts hello World
bun run src/index.ts api
bun run src/index.ts items
```

#### 桌面应用
```bash
cd apps/desktop
bun run dev
# 自动启动 Tauri 开发窗口
```

## 🏗️ 构建

### 构建所有项目

```bash
bun run build
```

### 单独构建

#### Web 前端
```bash
cd apps/web
bun run build
```

#### CLI 工具
```bash
cd packages/cli
bun run build
```

#### 桌面应用
```bash
cd apps/desktop
bun run build
# 生成的安装包在 src-tauri/target/release/bundle/
```

## 📝 CLI 命令

```bash
# 显示项目信息
bun run --cwd packages/cli dev info

# 问候
bun run --cwd packages/cli dev hello "开发者"

# 检查 API 健康状态
bun run --cwd packages/cli dev api

# 获取数据项
bun run --cwd packages/cli dev items

# 模拟构建
bun run --cwd packages/cli dev build -p web
```

## 🧪 测试

```bash
# 运行所有测试
bun run test

# Python API 测试
cd apps/api
bun run test
```

## 🎨 功能特性

### Dashboard (Web 应用)
- ✅ 响应式侧边栏
- ✅ 统计卡片（总用户、活跃用户、收入、转化率）
- ✅ 折线图（用户增长趋势）
- ✅ 柱状图（收入分析）
- ✅ 数据表格（用户列表）
- ✅ 暗色模式支持
- ✅ 基于 shadcn-svelte 的 UI 组件

### API 服务
- ✅ 健康检查接口
- ✅ RESTful CRUD 操作
- ✅ 自动生成 API 文档
- ✅ CORS 支持
- ✅ Pydantic 数据验证

### CLI 工具
- ✅ 彩色输出
- ✅ 加载动画
- ✅ API 健康检查
- ✅ 数据查询
- ✅ 项目信息显示

### 桌面应用
- ✅ 集成 Web 前端
- ✅ 跨平台支持（Windows、macOS、Linux）
- ✅ 原生性能
- ✅ 小体积安装包

## 🔗 项目依赖关系

```
desktop (Tauri)
  └── web (Svelte)
  └── api (FastAPI) [运行时依赖]
  
cli (Bun CLI)
  └── api (FastAPI) [运行时依赖]
```

## 📚 项目管理

### 添加依赖

#### Web 项目
```bash
cd apps/web
bun add package-name
```

#### CLI 项目
```bash
cd packages/cli
bun add package-name
```

#### Python 项目
```bash
cd apps/api
uv add package-name
```

### 清理

```bash
# 清理所有构建产物和依赖
bun run clean

# 清理单个项目
cd apps/web && bun run clean
```

## 🎯 最佳实践

1. **使用 Turborepo**: 利用缓存加速构建
2. **使用 Bun**: 替代 npm/yarn，获得更快的速度
3. **使用 uv**: 管理 Python 依赖，比 pip 更快
4. **代码风格**: 使用各项目的格式化工具保持一致
5. **类型安全**: TypeScript 和 Python 类型注解

## 📖 参考文档

- [Bun 文档](https://bun.sh/docs)
- [Turborepo 文档](https://turbo.build/repo/docs)
- [FastAPI 文档](https://fastapi.tiangolo.com/)
- [Svelte 文档](https://svelte.dev/)
- [SvelteKit 文档](https://kit.svelte.dev/)
- [shadcn-svelte 文档](https://www.shadcn-svelte.com/)
- [Tauri 文档](https://tauri.app/)
- [uv 文档](https://github.com/astral-sh/uv)

## 📄 License

MIT

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！
