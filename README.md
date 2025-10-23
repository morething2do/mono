# Monorepo 项目模板

一个功能完整的 Monorepo 项目模板，集成了现代化的全栈开发工具和框架。

## 🏗️ 项目结构

```
.
├── apps/
│   ├── api/              # FastAPI 后端（Python + uv）
│   ├── web/              # Svelte 前端（SvelteKit + shadcn-svelte）
│   └── desktop/          # Tauri 桌面应用
├── packages/
│   └── cli/              # CLI 工具（Bun + TypeScript）
├── package.json          # 根配置
└── turbo.json           # Turborepo 配置
```

## 🚀 技术栈

### 前端
- **框架**: Svelte 5 + SvelteKit
- **UI 组件**: shadcn-svelte
- **样式**: Tailwind CSS
- **类型**: TypeScript
- **运行时**: Bun

### 后端
- **框架**: FastAPI
- **包管理**: uv
- **语言**: Python 3.12+

### 桌面应用
- **框架**: Tauri 2.0
- **语言**: Rust + TypeScript

### CLI
- **运行时**: Bun
- **语言**: TypeScript

### Monorepo 工具
- **任务运行**: Turborepo
- **包管理**: Bun workspaces

## 📦 前置要求

- [Bun](https://bun.sh/) >= 1.0.0
- [uv](https://github.com/astral-sh/uv) >= 0.1.0
- [Rust](https://rustup.rs/) >= 1.75.0
- [Python](https://www.python.org/) >= 3.12

## 🛠️ 安装

```bash
# 安装所有依赖
bun install

# 安装 Python 依赖（在 apps/api 目录）
cd apps/api && uv sync
```

## 💻 开发

```bash
# 启动所有项目的开发模式
bun dev

# 启动特定项目
bun dev --filter=web
bun dev --filter=api
bun dev --filter=cli
bun dev --filter=desktop
```

## 🏗️ 构建

```bash
# 构建所有项目
bun run build

# 构建特定项目
bun run build --filter=web
bun run build --filter=desktop
```

## 🧪 测试

```bash
# 运行所有测试
bun test

# 运行特定项目的测试
bun test --filter=web
```

## 📝 代码质量

```bash
# 类型检查
bun run type-check

# 代码检查
bun run lint

# 代码格式化
bun run format
```

## 📁 子项目说明

### apps/api
FastAPI 后端服务，使用 uv 管理依赖。提供 RESTful API 接口。

### apps/web
基于 SvelteKit 的现代化前端应用，集成 shadcn-svelte 组件库，包含：
- Dashboard 布局
- 侧边栏导航
- 图表展示
- 数据表格

### apps/desktop
基于 Tauri 2.0 的跨平台桌面应用，打包 web 应用生成原生应用。

### packages/cli
命令行工具，提供项目管理和开发工具功能。

## 🔗 依赖关系

```
desktop → web
desktop → api
desktop → cli
```

## 📄 许可证

MIT
