# Web 前端

基于 SvelteKit 和 shadcn-svelte 的现代化前端应用。

## 技术栈

- **SvelteKit**: 全栈 Web 框架
- **Svelte 5**: 响应式 UI 框架
- **TypeScript**: 类型安全
- **Tailwind CSS**: 实用优先的 CSS 框架
- **shadcn-svelte**: 可复用的 UI 组件
- **Lucide Svelte**: 图标库

## 特性

- ✨ Dashboard 布局与侧边栏
- 📊 数据统计卡片
- 📈 图表展示区域
- 📋 数据表格
- 🎨 暗色模式支持
- 📱 响应式设计

## 开发

```bash
# 安装依赖
bun install

# 启动开发服务器
bun dev

# 或者使用 turbo
bun dev --filter=web
```

应用将运行在 http://localhost:5173

## 构建

```bash
# 生产构建
bun run build

# 预览生产构建
bun run preview
```

## 项目结构

```
src/
├── lib/
│   ├── components/
│   │   └── ui/          # UI 组件
│   └── utils.ts         # 工具函数
├── routes/
│   ├── +layout.svelte   # 全局布局
│   └── +page.svelte     # 首页
└── app.css              # 全局样式
```

## 添加新组件

使用 shadcn-svelte 命令添加组件：

```bash
npx shadcn-svelte@latest add [component-name]
```
