# Desktop 应用构建修复记录

## 问题概述

Desktop 应用在初始状态下无法正常构建，存在多个配置错误。

## 修复的问题

### 1. Cargo.toml 包名错误 ❌ → ✅

**问题**: Rust 包名 `--alpha` 无效，违反了 Rust 命名规则（不能以连字符开头）

**修复**: 
- 将包名从 `--alpha` 改为 `monorepo-desktop`
- 将库名从 `__alpha_lib` 改为 `monorepo_desktop_lib`

**文件**: `src-tauri/Cargo.toml`

### 2. Rust 源代码引用错误 ❌ → ✅

**问题**: `main.rs` 中引用了旧的库名 `__alpha_lib`

**修复**: 更新为新的库名 `monorepo_desktop_lib`

**文件**: `src-tauri/src/main.rs`

### 3. Tauri 配置路径错误 ❌ → ✅

**问题**: `tauri.conf.json` 中的 `frontendDist` 路径配置不正确

**原配置**: `../web/.svelte-kit/output/client` (相对于 src-tauri 目录)
**修复后**: `../../web/.svelte-kit/output/client` (正确的相对路径)

**文件**: `src-tauri/tauri.conf.json`

### 4. Bundle 目标配置优化 ⚠️ → ✅

**问题**: 尝试构建所有格式（包括 AppImage）会因为环境依赖问题失败

**修复**: 配置为只构建稳定的格式（deb 和 rpm）

**原配置**: `"targets": "all"`
**修复后**: `"targets": ["deb", "rpm"]`

**文件**: `src-tauri/tauri.conf.json`

## 构建结果

构建成功后会生成以下产物：

- ✅ **可执行文件** (~13MB): `target/release/monorepo-desktop`
- ✅ **Debian 包** (~3.9MB): `target/release/bundle/deb/Monorepo Desktop_0.1.0_amd64.deb`
- ✅ **RPM 包** (~3.9MB): `target/release/bundle/rpm/Monorepo Desktop-0.1.0-1.x86_64.rpm`

## 构建命令

```bash
# 在 desktop 目录下运行
cd apps/desktop
bun run build

# 清理构建产物
bun run clean
```

## 技术栈

- **前端**: Svelte + SvelteKit
- **桌面框架**: Tauri 2.x
- **后端语言**: Rust
- **构建工具**: Bun + Cargo
