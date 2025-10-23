#!/bin/bash
set -e

echo "🚀 设置 Monorepo 项目..."

echo ""
echo "📦 检查前置依赖..."

if ! command -v bun &> /dev/null; then
    echo "❌ Bun 未安装，请访问 https://bun.sh 安装"
    exit 1
fi
echo "✅ Bun 已安装: $(bun --version)"

if ! command -v uv &> /dev/null; then
    echo "❌ uv 未安装，请访问 https://github.com/astral-sh/uv 安装"
    exit 1
fi
echo "✅ uv 已安装: $(uv --version)"

if ! command -v cargo &> /dev/null; then
    echo "❌ Rust 未安装，请访问 https://rustup.rs 安装"
    exit 1
fi
echo "✅ Rust 已安装: $(rustc --version)"

echo ""
echo "📥 安装 JavaScript/TypeScript 依赖..."
bun install

echo ""
echo "🐍 安装 Python 依赖..."
cd apps/api
uv sync
cd ../..

echo ""
echo "✨ 设置完成！"
echo ""
echo "可用命令："
echo "  bun dev              - 启动所有项目的开发模式"
echo "  bun dev --filter=web - 启动 Web 前端"
echo "  bun dev --filter=api - 启动 API 后端"
echo "  bun dev --filter=cli - 启动 CLI 工具"
echo "  bun dev --filter=desktop - 启动桌面应用"
echo "  bun run build        - 构建所有项目"
echo "  bun test             - 运行测试"
echo ""
