<script lang="ts">
	import Button from '$lib/components/ui/button.svelte';
	import Card from '$lib/components/ui/card.svelte';
	import LineChart from '$lib/components/charts/LineChart.svelte';
	import BarChart from '$lib/components/charts/BarChart.svelte';
	import { Home, BarChart3, Users, Settings, Menu, TrendingUp, DollarSign, Activity, UserPlus } from 'lucide-svelte';

	let sidebarOpen = $state(true);

	const menuItems = [
		{ icon: Home, label: '首页', href: '/' },
		{ icon: BarChart3, label: '分析', href: '/analytics' },
		{ icon: Users, label: '用户', href: '/users' },
		{ icon: Settings, label: '设置', href: '/settings' }
	];

	const stats = [
		{ label: '总用户', value: '2,543', change: '+12.5%', icon: Users, trend: 'up' },
		{ label: '活跃用户', value: '1,843', change: '+8.2%', icon: Activity, trend: 'up' },
		{ label: '收入', value: '¥45,231', change: '+23.1%', icon: DollarSign, trend: 'up' },
		{ label: '转化率', value: '3.24%', change: '+2.4%', icon: TrendingUp, trend: 'up' }
	];

	// 用户增长数据
	const userGrowthData = {
		labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
		datasets: [
			{
				label: '新用户',
				data: [65, 89, 102, 134, 165, 189],
				borderColor: 'rgb(59, 130, 246)',
				backgroundColor: 'rgba(59, 130, 246, 0.1)',
				fill: true,
				tension: 0.4
			}
		]
	};

	// 收入分析数据
	const revenueData = {
		labels: ['1月', '2月', '3月', '4月', '5月', '6月'],
		datasets: [
			{
				label: '收入 (¥)',
				data: [12000, 19000, 15000, 25000, 32000, 45231],
				backgroundColor: [
					'rgba(59, 130, 246, 0.8)',
					'rgba(59, 130, 246, 0.8)',
					'rgba(59, 130, 246, 0.8)',
					'rgba(59, 130, 246, 0.8)',
					'rgba(59, 130, 246, 0.8)',
					'rgba(59, 130, 246, 0.8)'
				],
				borderColor: 'rgb(59, 130, 246)',
				borderWidth: 1
			}
		]
	};

	const recentUsers = [
		{ name: '张三', email: 'zhangsan@example.com', status: '活跃', date: '2024-01-15', avatar: '👤' },
		{ name: '李四', email: 'lisi@example.com', status: '活跃', date: '2024-01-14', avatar: '👤' },
		{ name: '王五', email: 'wangwu@example.com', status: '离线', date: '2024-01-13', avatar: '👤' },
		{ name: '赵六', email: 'zhaoliu@example.com', status: '活跃', date: '2024-01-12', avatar: '👤' },
		{ name: '钱七', email: 'qianqi@example.com', status: '离线', date: '2024-01-11', avatar: '👤' }
	];
</script>

<div class="flex h-screen bg-background">
	<!-- 侧边栏 -->
	<aside
		class="w-64 border-r bg-card transition-all duration-300 {sidebarOpen
			? 'translate-x-0'
			: '-translate-x-full'} fixed left-0 top-0 z-40 h-full md:relative"
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
						<div class="flex items-center justify-between">
							<div class="text-sm font-medium text-muted-foreground">{stat.label}</div>
							<svelte:component this={stat.icon} class="h-4 w-4 text-muted-foreground" />
						</div>
						<div class="mt-2 flex items-baseline">
							<div class="text-2xl font-bold">{stat.value}</div>
							<div class="ml-2 text-sm font-medium text-green-600 flex items-center gap-1">
								<TrendingUp class="h-3 w-3" />
								{stat.change}
							</div>
						</div>
					</Card>
				{/each}
			</div>

			<!-- 图表区域 -->
			<div class="grid gap-4 md:grid-cols-2 mb-4">
				<Card class="p-6">
					<h3 class="mb-4 text-lg font-semibold">用户增长趋势</h3>
					<div class="h-64">
						<LineChart data={userGrowthData} />
					</div>
				</Card>

				<Card class="p-6">
					<h3 class="mb-4 text-lg font-semibold">收入分析</h3>
					<div class="h-64">
						<BarChart data={revenueData} />
					</div>
				</Card>
			</div>

			<!-- 数据表格 -->
			<Card class="p-6">
				<div class="mb-4 flex items-center justify-between">
					<h3 class="text-lg font-semibold">最近的用户</h3>
					<Button size="sm">
						<UserPlus class="mr-2 h-4 w-4" />
						添加用户
					</Button>
				</div>
				<div class="overflow-x-auto">
					<table class="w-full">
						<thead>
							<tr class="border-b">
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">用户</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">邮箱</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">状态</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">注册日期</th>
								<th class="pb-3 text-left text-sm font-medium text-muted-foreground">操作</th>
							</tr>
						</thead>
						<tbody>
							{#each recentUsers as user}
								<tr class="border-b hover:bg-muted/50 transition-colors">
									<td class="py-3 text-sm">
										<div class="flex items-center gap-2">
											<span class="text-2xl">{user.avatar}</span>
											<span class="font-medium">{user.name}</span>
										</div>
									</td>
									<td class="py-3 text-sm text-muted-foreground">{user.email}</td>
									<td class="py-3 text-sm">
										<span
											class="rounded-full px-2 py-1 text-xs font-medium {user.status === '活跃'
												? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'
												: 'bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-400'}"
										>
											{user.status}
										</span>
									</td>
									<td class="py-3 text-sm text-muted-foreground">{user.date}</td>
									<td class="py-3 text-sm">
										<Button variant="ghost" size="sm">查看</Button>
									</td>
								</tr>
							{/each}
						</tbody>
					</table>
				</div>
			</Card>
		</main>
	</div>
</div>
