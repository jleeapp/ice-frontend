# ice-frontend 覆冰监测系统前端

## 项目概述

覆冰监测系统前端部署仓库，通过 Docker + Nginx 提供静态文件服务。

> **重要**：本仓库不进行在线构建。请将已构建完成的静态前端文件放入 `dist/` 目录。

## 项目结构

```
ice-frontend/
├── start.sh                # 启动脚本（检查 dist 后启动服务）
├── docker-compose.yml      # Docker Compose 配置（生产环境）
├── docker-compose.test.yml # Docker Compose 配置（测试环境）
├── Dockerfile              # Nginx 镜像构建文件（生产环境）
├── Dockerfile.test         # Nginx 镜像构建文件（测试环境）
├── nginx.conf              # Nginx 配置
├── dist/                   # 生产环境静态文件（需自行添加）
├── dist-test/              # 测试环境静态文件（需自行添加）
└── README.md
```

## 环境说明

| 环境     | 前端目录     | 配置文件                  | 默认端口 | 运行位置   |
| -------- | ------------ | ------------------------- | -------- | ---------- |
| 生产环境 | `dist/`      | `docker-compose.yml`      | 3080     | 云端服务器 |
| 测试环境 | `dist-test/` | `docker-compose.test.yml` | 8080     | 本地/云端  |

> **说明**：测试环境配置可在本地开发机或云端服务器上运行，两者共用相同的 Docker 配置。

## 快速开始

### 生产环境

1. 将构建产物复制到 `dist/` 目录下
2. 启动服务：

```bash
# 使用启动脚本（推荐）
./start.sh

# 或手动启动
HOST_PORT=80 docker compose up -d
```

### 测试环境

1. 将测试版构建产物复制到 `dist-test/` 目录下
2. 启动服务（本地或云端均可）：

```bash
# 启动测试环境
docker compose -f docker-compose.test.yml up -d

# 或指定端口
HOST_PORT=8080 docker compose -f docker-compose.test.yml up -d
```

## 常用命令

### 生产环境

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

### 测试环境

```bash
# 启动服务（本地或云端）
docker compose -f docker-compose.test.yml up -d

# 停止服务
docker compose -f docker-compose.test.yml down

# 重启服务（更新前端文件后执行）
docker compose -f docker-compose.test.yml restart

# 查看日志
docker compose -f docker-compose.test.yml logs -f
```

## 环境变量

| 变量名    | 说明     | 生产默认值 | 测试默认值 |
| --------- | -------- | ---------- | ---------- |
| HOST_PORT | 服务端口 | 3080       | 8080       |

---

*更新日期: 2026-01-06*
