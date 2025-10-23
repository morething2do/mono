# CLI 工具

基于 Bun 和 TypeScript 的命令行工具。

## 技术栈

- **Bun**: 快速的 JavaScript 运行时
- **TypeScript**: 类型安全
- **Commander**: 命令行参数解析
- **Chalk**: 终端颜色输出
- **Ora**: 终端加载动画

## 安装依赖

```bash
bun install
```

## 开发

```bash
# 运行开发模式
bun dev

# 或者使用 turbo
bun dev --filter=cli
```

## 构建

```bash
bun run build
```

## 使用

```bash
# 打印帮助信息
bun run src/index.ts --help

# 运行命令
bun run src/index.ts hello
bun run src/index.ts hello "张三"
bun run src/index.ts build --project web
bun run src/index.ts dev --port 3000
bun run src/index.ts info
```

## 可用命令

- `hello [name]` - 打印欢迎信息
- `build` - 构建项目
- `dev` - 启动开发服务器
- `info` - 显示项目信息
