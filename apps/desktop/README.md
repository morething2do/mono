# Desktop 应用

基于 Tauri 2.0 的跨平台桌面应用。

## 技术栈

- **Tauri 2.0**: 轻量级桌面应用框架
- **Rust**: 后端核心
- **TypeScript**: 前端类型安全
- **Vite**: 快速构建工具

## 特性

- 🚀 轻量级：比 Electron 小 10 倍以上
- 🔒 安全：内置安全特性
- ⚡ 快速：Rust 后端性能优异
- 🎨 现代化：使用 Web 技术构建 UI
- 📦 跨平台：支持 Windows、macOS 和 Linux

## 前置要求

安装 Tauri 所需的系统依赖：

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install libwebkit2gtk-4.1-dev \
  build-essential \
  curl \
  wget \
  file \
  libxdo-dev \
  libssl-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev
```

### macOS
```bash
xcode-select --install
```

### Windows
安装 Microsoft Visual Studio C++ Build Tools

## 开发

```bash
# 安装依赖
bun install

# 启动开发模式（热重载）
bun dev

# 或者使用 turbo
bun dev --filter=desktop
```

## 构建

```bash
# 构建应用
bun run build

# 输出位置
# Linux: src-tauri/target/release/bundle/
# macOS: src-tauri/target/release/bundle/dmg/
# Windows: src-tauri/target/release/bundle/msi/
```

## 项目结构

```
desktop/
├── src/                 # 前端源码
├── src-tauri/          # Tauri Rust 后端
│   ├── src/            # Rust 源码
│   ├── Cargo.toml      # Rust 依赖
│   └── tauri.conf.json # Tauri 配置
├── package.json
└── vite.config.ts
```

## 与其他项目集成

该应用可以：
- 嵌入 Web 前端应用
- 调用 Python API 后端
- 使用 CLI 工具功能

## 了解更多

- [Tauri 文档](https://tauri.app/)
- [Tauri API](https://tauri.app/reference/javascript/api/)
