# ice-frontend 覆冰监测系统前端

## 项目概述

覆冰监测系统前端部署仓库，通过 Docker + Nginx 提供静态文件服务。

> **重要**：本仓库不进行在线构建。请将已构建完成的静态前端文件放入 `dist/` 目录。

## 项目结构

```
ice-frontend/
├── start.sh           # 启动脚本（检查 dist 后启动服务）
├── docker-compose.yml # Docker Compose 配置
├── Dockerfile         # Nginx 镜像构建文件
├── nginx.conf         # Nginx 配置
├── dist/              # 预构建的静态文件（需自行添加）
└── README.md
```

## 快速开始

1. 将构建产物复制到 `dist/` 目录下
2. 启动服务：

```bash
# 使用启动脚本（推荐）
./start.sh

# 或手动启动
HOST_PORT=80 docker compose up -d
```

## 常用命令

```bash
# 启动服务
docker compose up -d

# 停止服务
docker compose down

# 重启服务（更新前端文件后执行）
docker compose restart

# 查看日志
docker compose logs -f
```

## 环境变量

| 变量名    | 说明     | 默认值 |
| --------- | -------- | ------ |
| HOST_PORT | 服务端口 | 3080   |

---

*更新日期: 2025-12-28*
