# Web 前端应用

基于 Svelte 5 + SvelteKit + shadcn-svelte 的现代 Web 应用。

## 技术栈

- **框架**: Svelte 5 + SvelteKit
- **UI 库**: shadcn-svelte
- **样式**: Tailwind CSS
- **图表**: Chart.js + svelte-chartjs
- **图标**: lucide-svelte
- **类型**: TypeScript
- **构建工具**: Vite
- **包管理**: Bun

## 功能特性

### Dashboard
- ✅ 响应式侧边栏导航
- ✅ 统计卡片展示
- ✅ 折线图（用户增长趋势）
- ✅ 柱状图（收入分析）
- ✅ 数据表格（用户列表）
- ✅ 暗色模式支持

### UI 组件
- Button（按钮）
- Card（卡片）
- Badge（徽章）
- Input（输入框）

### 图表组件
- LineChart（折线图）
- BarChart（柱状图）

## 开发

```bash
# 安装依赖
bun install

# 启动开发服务器
bun run dev

# 访问 http://localhost:5173
```

## 构建

```bash
# 构建生产版本
bun run build

# 预览构建结果
bun run preview
```

## 项目结构

```
src/
├── lib/
│   ├── components/
│   │   ├── ui/          # 基础 UI 组件
│   │   │   ├── button.svelte
│   │   │   ├── card.svelte
│   │   │   ├── badge.svelte
│   │   │   └── input.svelte
│   │   └── charts/      # 图表组件
│   │       ├── LineChart.svelte
│   │       └── BarChart.svelte
│   ├── utils.ts         # 工具函数
│   └── index.ts
├── routes/
│   ├── +layout.svelte   # 全局布局
│   └── +page.svelte     # 首页（Dashboard）
├── app.css              # 全局样式
└── app.html             # HTML 模板
```

## 添加新组件

### 1. 添加 UI 组件

在 `src/lib/components/ui/` 创建新组件：

```svelte
<!-- src/lib/components/ui/new-component.svelte -->
<script lang="ts">
	import { cn } from '$lib/utils';
	
	interface Props {
		class?: string;
		children?: any;
	}
	
	let { class: className, children }: Props = $props();
</script>

<div class={cn('base-styles', className)}>
	{@render children?.()}
</div>
```

### 2. 添加图表组件

参考现有的 LineChart 和 BarChart 组件。

### 3. 添加新页面

在 `src/routes/` 创建新的路由文件：

```svelte
<!-- src/routes/new-page/+page.svelte -->
<script lang="ts">
	// 页面逻辑
</script>

<div>
	<!-- 页面内容 -->
</div>
```

## 样式指南

### Tailwind CSS

使用 Tailwind 实用类：

```svelte
<div class="flex items-center gap-4 p-6 rounded-lg bg-card">
	<!-- 内容 -->
</div>
```

### CSS 变量

使用 shadcn 主题变量：

```css
.custom-class {
	background-color: hsl(var(--background));
	color: hsl(var(--foreground));
}
```

## 类型安全

项目完全使用 TypeScript，确保类型安全：

```typescript
interface User {
	id: number;
	name: string;
	email: string;
}

let users: User[] = $state([]);
```

## API 集成

连接到后端 API：

```typescript
// 获取数据
const response = await fetch('http://localhost:8000/api/items');
const data = await response.json();

// POST 请求
const response = await fetch('http://localhost:8000/api/items', {
	method: 'POST',
	headers: { 'Content-Type': 'application/json' },
	body: JSON.stringify(newItem)
});
```

## 性能优化

- 使用 Svelte 的响应式系统
- 懒加载图表组件
- 代码分割
- 图片优化

## 部署

### 作为静态站点

```bash
bun run build
# 输出在 .svelte-kit/output/client/
```

### 集成到 Tauri

构建输出会被 Tauri 桌面应用使用。

## 相关文档

- [Svelte 文档](https://svelte.dev/)
- [SvelteKit 文档](https://kit.svelte.dev/)
- [shadcn-svelte 文档](https://www.shadcn-svelte.com/)
- [Tailwind CSS 文档](https://tailwindcss.com/)
- [Chart.js 文档](https://www.chartjs.org/)
