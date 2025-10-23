# 贡献指南

感谢你考虑为本项目做出贡献！

## 开发流程

1. **Fork 项目**
2. **创建特性分支** (`git checkout -b feature/amazing-feature`)
3. **提交更改** (`git commit -m 'feat: 添加某个特性'`)
4. **推送到分支** (`git push origin feature/amazing-feature`)
5. **开启 Pull Request**

## 提交信息规范

我们遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

- `feat:` 新功能
- `fix:` 修复 bug
- `docs:` 文档更新
- `style:` 代码格式化（不影响代码运行）
- `refactor:` 重构
- `perf:` 性能优化
- `test:` 测试相关
- `chore:` 构建过程或辅助工具的变动

示例：
```
feat: 添加用户认证功能
fix: 修复登录页面的样式问题
docs: 更新 README 安装说明
```

## 代码规范

### TypeScript/JavaScript
- 使用 TypeScript 编写新代码
- 运行 `bun run lint` 检查代码
- 运行 `bun run format` 格式化代码

### Python
- 遵循 PEP 8 规范
- 使用 type hints
- 运行测试确保代码质量

### Rust
- 使用 `cargo fmt` 格式化代码
- 使用 `cargo clippy` 检查代码
- 编写文档注释

## 开发环境设置

1. 安装前置要求（见 README.md）
2. 克隆仓库
3. 安装依赖：
   ```bash
   bun install
   cd apps/api && uv sync
   ```
4. 启动开发服务器：
   ```bash
   bun dev
   ```

## 测试

在提交 PR 之前，请确保：
- 所有测试通过
- 代码格式化正确
- 类型检查无错误

```bash
bun test
bun run type-check
bun run lint
```

## 问题反馈

如果发现 bug 或有功能建议，请：
1. 检查是否已有相关 issue
2. 创建新 issue，提供详细信息
3. 使用合适的标签

## 行为准则

- 尊重他人
- 接受建设性批评
- 关注对社区最有利的事情
- 对新贡献者友好

感谢你的贡献！🎉
