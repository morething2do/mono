# 贡献指南

感谢你考虑为本项目做出贡献！

## 开发环境设置

### 1. 克隆仓库

```bash
git clone <repository-url>
cd monorepo
```

### 2. 运行设置脚本

```bash
./scripts/setup.sh
```

或手动设置：

```bash
# 安装依赖
bun install
cd apps/api && uv sync && cd ../..

# 复制环境变量
cp .env.example .env
```

## 开发流程

### 分支策略

- `main`: 主分支，保持稳定
- `develop`: 开发分支
- `feature/*`: 功能分支
- `fix/*`: 修复分支

### 提交信息规范

使用约定式提交（Conventional Commits）：

```
<type>(<scope>): <subject>

<body>

<footer>
```

类型（type）：
- `feat`: 新功能
- `fix`: 修复
- `docs`: 文档
- `style`: 格式（不影响代码运行）
- `refactor`: 重构
- `test`: 测试
- `chore`: 构建过程或辅助工具的变动

示例：
```
feat(web): 添加用户列表页面

- 实现用户列表组件
- 添加分页功能
- 集成 API 接口

Closes #123
```

### Pull Request 流程

1. Fork 仓库
2. 创建功能分支
3. 提交更改
4. 推送到 Fork
5. 创建 Pull Request
6. 等待 Code Review
7. 合并

## 代码规范

### TypeScript/JavaScript

```typescript
// 使用类型注解
interface User {
  id: number;
  name: string;
  email: string;
}

// 使用函数类型
function getUser(id: number): Promise<User> {
  // ...
}

// 使用 async/await
async function fetchData() {
  const response = await fetch(url);
  return response.json();
}
```

### Python

```python
# 使用类型注解
from typing import List, Optional

def get_items(limit: Optional[int] = None) -> List[Item]:
    """获取数据项列表
    
    Args:
        limit: 限制返回数量
        
    Returns:
        数据项列表
    """
    # ...
```

### Svelte

```svelte
<script lang="ts">
	// 使用 Svelte 5 语法
	interface Props {
		title: string;
		items: Item[];
	}
	
	let { title, items }: Props = $props();
	let count = $state(0);
</script>

<div>
	<h1>{title}</h1>
	<!-- 内容 -->
</div>
```

### Rust

```rust
// 使用文档注释
/// 问候函数
/// 
/// # Arguments
/// * `name` - 名称
/// 
/// # Returns
/// 问候语
#[tauri::command]
fn greet(name: &str) -> String {
    format!("你好，{}！", name)
}
```

## 目录结构规范

### 添加新的 API 路由

```
apps/api/api/routers/
└── new_router.py
```

### 添加新的前端页面

```
apps/web/src/routes/
└── new-page/
    └── +page.svelte
```

### 添加新的组件

```
apps/web/src/lib/components/
└── feature/
    └── NewComponent.svelte
```

## 测试

### Python 测试

```bash
cd apps/api
bun run test
```

### TypeScript 测试

```bash
cd apps/web
bun run test
```

## 文档

### 代码注释

- 所有公共 API 必须有文档注释
- 复杂逻辑需要解释性注释
- 使用中文注释

### README 更新

- 添加新功能时更新相关 README
- 保持示例代码最新
- 更新功能列表

## 性能优化

### 前端优化

- 使用懒加载
- 优化图片大小
- 减少不必要的重新渲染
- 使用虚拟滚动

### 后端优化

- 使用数据库索引
- 实现缓存策略
- 优化查询
- 异步处理

## 安全

### 输入验证

- 所有用户输入必须验证
- 使用 Pydantic 模型验证（Python）
- 使用 TypeScript 类型验证

### 敏感信息

- 不要提交敏感信息到仓库
- 使用环境变量
- 添加到 .gitignore

## 构建和部署

### 本地构建

```bash
bun run build
```

### 检查构建

- 确保所有项目构建成功
- 检查构建产物大小
- 测试构建后的应用

## 常见问题

### Q: 如何添加新的依赖？

**JavaScript/TypeScript:**
```bash
cd apps/web
bun add package-name
```

**Python:**
```bash
cd apps/api
uv add package-name
```

### Q: 如何解决依赖冲突？

1. 删除 node_modules 和 lockfile
2. 重新安装：`bun install`

### Q: 如何调试 Tauri 应用？

```bash
cd apps/desktop
bun run dev
# 使用浏览器开发工具
```

## Code Review 清单

- [ ] 代码符合项目规范
- [ ] 添加了必要的测试
- [ ] 更新了相关文档
- [ ] 提交信息清晰
- [ ] 没有引入新的警告
- [ ] 性能没有退化
- [ ] 通过了所有测试

## 联系方式

- Issue Tracker: GitHub Issues
- 讨论: GitHub Discussions
- Email: [项目邮箱]

## 许可证

通过贡献，你同意你的贡献将在 MIT 许可证下发布。
