# ice-frontend 覆冰监测系统前端

## 项目概述

覆冰监测系统前端部署仓库，通过 Docker + nginx 提供静态文件服务。

> **重要**：本仓库不进行在线构建。请将已构建完成的静态前端文件放入 `dist/` 目录，Docker 直接使用 nginx 指向该目录提供服务。  
> `dist-example/` 包含示例说明，可参考其结构。

## 项目结构

```
ice-frontend/
├── start.sh                  # 启动脚本（检查 dist 后启动服务）
├── docker-compose.base.yml   # 基础服务配置
├── docker-compose.dev.yml    # 开发环境配置（端口 3080）
├── docker-compose.cloud.yml  # 测试/云环境（端口 8080）
├── docker-compose.prod.yml   # 生产环境配置（端口 80）
├── Dockerfile                # 单阶段 nginx 镜像（可选构建）
├── dist/                     # 预构建的静态文件（需自行添加）
├── dist-example/             # 示例目录结构说明
└── nginx/
    ├── nginx.conf            # nginx 主配置
    └── default.conf          # 站点配置
```

## 快速开始

### Docker 部署

1. 将构建产物复制到仓库根目录的 `dist/` 下（示例结构见 `dist-example/README.md`）。
2. 使用启动脚本（推荐）或手动运行 Compose 启动服务。

#### 使用启动脚本（推荐）

启动脚本会自动检查 `dist/` 目录是否存在：

```bash
# 生产环境（端口 80）
./start.sh prod

# 测试/云环境（端口 8080）
./start.sh cloud

# 开发环境（端口 3080）
./start.sh dev
```

#### 手动启动

本地开发环境（端口 3080）：
```bash
docker compose -f docker-compose.base.yml -f docker-compose.dev.yml up -d
# 访问 http://localhost:3080
```

测试/云环境（端口 8080）：
```bash
docker compose -f docker-compose.base.yml -f docker-compose.cloud.yml up -d
# 访问 http://<服务器IP>:8080
```

生产环境（端口 80）：
```bash
# 1. 创建数据目录
sudo mkdir -p /data/ice-frontend/logs

# 2. 启动服务
docker compose -f docker-compose.base.yml -f docker-compose.prod.yml up -d
```

## 环境变量

| 变量名            | 说明                      | 默认值                  |
| ----------------- | ------------------------- | ----------------------- |
| VITE_API_BASE_URL | API 地址                  | /api                    |
| VITE_APP_TITLE    | 应用标题                  | 覆冰监测系统            |
| API_BASE_URL      | 后端服务地址（nginx代理） | http://ice-backend:3000 |

## 页面说明

| 页面     | 路径       | 功能                       |
| -------- | ---------- | -------------------------- |
| 监控总览 | /dashboard | 系统概览、统计数据、趋势图 |
| 覆冰监测 | /fubing    | 覆冰传感器数据展示         |
| 智能除冰 | /chubing   | 除冰设备状态、模块监控     |
| 线路覆冰 | /line      | 导线精灵、模拟导线数据     |
| 视频监控 | /video     | 实时视频、抓拍、回放       |

## 与后端联调

前端通过 nginx 反向代理将 `/api/*` 请求转发到后端服务：

```nginx
location /api/ {
    proxy_pass http://ice-backend:3000/;
}
```

确保前端容器与后端容器在同一 Docker 网络中。

---

*更新日期: 2025-12-27*
