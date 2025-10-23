#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Monorepo 项目设置脚本${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 检查 bun
echo -e "${YELLOW}检查 Bun...${NC}"
if ! command -v bun &> /dev/null; then
    echo -e "${RED}✗ Bun 未安装${NC}"
    echo -e "请运行: ${BLUE}curl -fsSL https://bun.sh/install | bash${NC}"
    exit 1
else
    echo -e "${GREEN}✓ Bun 已安装: $(bun --version)${NC}"
fi

# 检查 uv
echo -e "${YELLOW}检查 uv...${NC}"
if ! command -v uv &> /dev/null; then
    echo -e "${RED}✗ uv 未安装${NC}"
    echo -e "请运行: ${BLUE}curl -LsSf https://astral.sh/uv/install.sh | sh${NC}"
    exit 1
else
    echo -e "${GREEN}✓ uv 已安装: $(uv --version)${NC}"
fi

# 检查 Rust
echo -e "${YELLOW}检查 Rust...${NC}"
if ! command -v rustc &> /dev/null; then
    echo -e "${YELLOW}⚠ Rust 未安装（构建桌面应用需要）${NC}"
    echo -e "安装命令: ${BLUE}curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh${NC}"
else
    echo -e "${GREEN}✓ Rust 已安装: $(rustc --version)${NC}"
fi

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  安装依赖${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 安装根依赖
echo -e "${YELLOW}安装根依赖...${NC}"
bun install
echo -e "${GREEN}✓ 根依赖安装完成${NC}"
echo ""

# 安装 Python 依赖
echo -e "${YELLOW}安装 Python 依赖...${NC}"
cd apps/api
uv sync
cd ../..
echo -e "${GREEN}✓ Python 依赖安装完成${NC}"
echo ""

# 创建 .env 文件
if [ ! -f .env ]; then
    echo -e "${YELLOW}创建 .env 文件...${NC}"
    cp .env.example .env
    echo -e "${GREEN}✓ .env 文件已创建${NC}"
else
    echo -e "${GREEN}✓ .env 文件已存在${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  设置完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}下一步：${NC}"
echo -e "  1. 启动所有服务: ${GREEN}bun run dev${NC}"
echo -e "  2. 启动 API: ${GREEN}cd apps/api && bun run dev${NC}"
echo -e "  3. 启动 Web: ${GREEN}cd apps/web && bun run dev${NC}"
echo -e "  4. 启动桌面应用: ${GREEN}cd apps/desktop && bun run dev${NC}"
echo -e "  5. 运行 CLI: ${GREEN}cd packages/cli && bun run dev info${NC}"
echo ""
echo -e "${BLUE}文档：${NC}"
echo -e "  - README.md"
echo -e "  - docs/QUICKSTART.md"
echo -e "  - docs/ARCHITECTURE.md"
echo ""
