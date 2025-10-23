<script lang="ts">
	import Button from '$lib/components/ui/button.svelte';
	import Card from '$lib/components/ui/card.svelte';
	import { Home, BarChart3, Users, Settings, Menu } from 'lucide-svelte';

	let sidebarOpen = $state(true);

	const menuItems = [
		{ icon: Home, label: '首页', href: '/' },
		{ icon: BarChart3, label: '分析', href: '/analytics' },
		{ icon: Users, label: '用户', href: '/users' },
		{ icon: Settings, label: '设置', href: '/settings' }
	];

	const stats = [
		{ label: '总用户', value: '2,543', change: '+12.5%' },
		{ label: '活跃用户', value: '1,843', change: '+8.2%' },
		{ label: '收入', value: '¥45,231', change: '+23.1%' },
		{ label: '转化率', value: '3.24%', change: '+2.4%' }
	];
</script>

<div class="flex h-screen bg-background">
	<!-- 侧边栏 -->
	<aside
		class="w-64 border-r bg-card transition-all duration-300 {sidebarOpen
			? 'translate-x-0'
			: '-translate-x-full'}"
	>
		<div class="flex h-16 items-center border-b px-6">
			<h1 class="text-xl font-bold">Monorepo 模板</h1>
		</div>
		<nav class="space-y-1 p-4">
			{#each menuItems as item}
				<a
					href={item.href}
					class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium transition-colors hover:bg-accent hover:text-accent-foreground"
				>
					<svelte:component this={item.icon} class="h-5 w-5" />
					{item.label}
				</a>
			{/each}
		</nav>
	</aside>

	<!-- 主内容区 -->
	<div class="flex flex-1 flex-col overflow-hidden">
		<!-- 顶部导航 -->
		<header class="flex h-16 items-center border-b bg-card px-6">
			<Button variant="ghost" size="icon" onclick={() => (sidebarOpen = !sidebarOpen)}>
				<Menu class="h-6 w-6" />
			</Button>
			<div class="ml-auto flex items-center gap-4">
				<Button variant="outline">通知</Button>
				<Button>用户</Button>
			</div>
		</header>

		<!-- 页面内容 -->
		<main class="flex-1 overflow-y-auto p-6">
			<div class="mb-8">
				<h2 class="text-3xl font-bold tracking-tight">Dashboard</h2>
				<p class="text-muted-foreground">欢迎使用 Monorepo 项目模板</p>
			</div>

			<!-- 统计卡片 -->
			<div class="mb-8 grid gap-4 md:grid-cols-2 lg:grid-cols-4">
				{#each stats as stat}
					<Card class="p-6">
						<div class="text-sm font-medium text-muted-foreground">{stat.label}</div>
						<div class="mt-2 flex items-baseline">
							<div class="text-2xl font-bold">{stat.value}</div>
							<div class="ml-2 text-sm font-medium text-green-600">{stat.change}</div>
						</div>
					</Card>
				{/each}
			</div>

			<!-- 图表区域 -->
			<div class="grid gap-4 md:grid-cols-2">
				<Card class="p-6">
					<h3 class="mb-4 text-lg font-semibold">用户增长趋势</h3>
					<div class="flex h-64 items-center justify-center border-2 border-dashed rounded-lg">
						<p class="text-muted-foreground">图表占位符</p>
					</div>
				</Card>

				<Card class="p-6">
					<h3 class="mb-4 text-lg font-semibold">收入分析</h3>
					<div class="flex h-64 items-center justify-center border-2 border-dashed rounded-lg">
						<p class="text-muted-foreground">图表占位符</p>
					</div>
				</Card>
			</div>

			<!-- 数据表格 -->
			<Card class="mt-4 p-6">
				<h3 class="mb-4 text-lg font-semibold">最近的用户</h3>
				<div class="overflow-x-auto">
					<table class="w-full">
						<thead>
							<tr class="border-b">
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">用户名</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">邮箱</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">状态</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">注册日期</th>
							</tr>
						</thead>
						<tbody>
							{#each [
								{ name: '张三', email: 'zhangsan@example.com', status: '活跃', date: '2024-01-15' },
								{ name: '李四', email: 'lisi@example.com', status: '活跃', date: '2024-01-14' },
								{ name: '王五', email: 'wangwu@example.com', status: '离线', date: '2024-01-13' }
							] as user}
								<tr class="border-b">
									<td class="py-3 text-sm">{user.name}</td>
									<td class="py-3 text-sm text-muted-foreground">{user.email}</td>
									<td class="py-3 text-sm">
										<span
											class="rounded-full px-2 py-1 text-xs {user.status === '活跃'
												? 'bg-green-100 text-green-700'
												: 'bg-gray-100 text-gray-700'}"
										>
											{user.status}
										</span>
									</td>
									<td class="py-3 text-sm text-muted-foreground">{user.date}</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</div>
			</Card>
		</main>
	</div>
</div>
