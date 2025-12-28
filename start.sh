#!/bin/bash
# ============================================================
# ice-frontend 启动脚本
# 检查 dist 目录是否存在后再启动 Docker 服务
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="$SCRIPT_DIR/dist"

# 检查 dist 目录
if [ ! -d "$DIST_DIR" ]; then
    echo "错误: dist/ 目录不存在！"
    echo ""
    echo "请将已构建的前端静态文件复制到 $DIST_DIR 目录下。"
    echo "示例结构见 dist-example/README.md"
    echo ""
    exit 1
fi

# 检查 dist 目录是否有 index.html
if [ ! -f "$DIST_DIR/index.html" ]; then
    echo "错误: dist/index.html 不存在！"
    echo ""
    echo "dist/ 目录似乎不包含有效的前端构建产物。"
    echo "请确保 index.html 等文件已正确复制。"
    echo ""
    exit 1
fi

echo "✓ dist/ 目录检查通过"

# 确定环境
ENV="${1:-prod}"

case "$ENV" in
    dev)
        echo "启动开发环境 (端口 3080)..."
        HOST_PORT=3080 docker compose up -d
        echo "访问: http://localhost:3080"
        ;;
    cloud|test)
        echo "启动测试/云环境 (端口 8080)..."
        HOST_PORT=8080 docker compose up -d
        echo "访问: http://<服务器IP>:8080"
        ;;
    prod|production)
        echo "启动生产环境 (端口 80)..."
        HOST_PORT=80 docker compose up -d
        echo "访问: http://<服务器IP>"
        ;;
    *)
        echo "用法: $0 [dev|cloud|prod]"
        echo "  dev   - 开发环境 (端口 3080)"
        echo "  cloud - 测试/云环境 (端口 8080)"
        echo "  prod  - 生产环境 (端口 80)"
        exit 1
        ;;
esac

echo ""
echo "✓ 服务已启动"
