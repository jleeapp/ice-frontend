# ice-frontend 覆冰监测系统前端

## 项目概述


覆冰监测系统前端部署仓库，通过 Docker + nginx 提供静态文件服务。

> **重要**：本仓库不进行在线构建。请将已构建完成的静态前端文件放入 `dist/` 目录，Docker 镜像会自动复制到 nginx 的 `/var/www/html` 目录下进行服务。  
> `dist-example/` 包含示例说明，可参考其结构。

## 项目结构


```
ice-frontend/
├── start.sh           # 启动脚本（检查 dist 后启动服务）
├── docker-compose.yml # 统一 Compose 配置
├── Dockerfile         # nginx 镜像构建文件
├── nginx.conf         # nginx 主配置（已合并）
├── dist/              # 预构建的静态文件（需自行添加）
├── dist-example/      # 示例目录结构说明
└── README.md
```

## 快速开始

### Docker 部署


1. 将构建产物复制到仓库根目录的 `dist/` 下（示例结构见 `dist-example/README.md`）。
2. 使用启动脚本（推荐）或手动运行 Compose 启动服务。

#### 通用启动方式

```bash
# 生产环境（端口 80）
HOST_PORT=80 docker compose up -d
# 开发环境（端口 3080）
docker compose up -d
# 云测试环境（端口 8080）
HOST_PORT=8080 docker compose up -d
```

> 默认会将 dist/ 目录内容挂载到 nginx 的 `/var/www/html`，无需手动创建 www/html 目录。

#### 更新前端文件

更改 dist 目录文件后，需重启容器生效：

```bash
docker compose restart
```

或清除浏览器缓存（Ctrl+Shift+R / Cmd+Shift+R）。

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


## 其它说明

当前配置不再默认反向代理后端 API，如需联调请参考 nginx.conf 注释，自行添加代理规则。

---

*更新日期: 2025-12-28*
