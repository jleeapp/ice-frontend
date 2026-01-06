# dist-test 目录说明

此目录用于存放 **测试环境** 的前端构建文件。

> **说明**：测试环境配置可在本地开发机或云端服务器上运行，两者共用相同的 Docker 配置。

## 与生产环境的区别

| 目录         | 用途     | 配置文件                                     | 运行位置   |
| ------------ | -------- | -------------------------------------------- | ---------- |
| `dist/`      | 生产环境 | `docker-compose.yml`, `Dockerfile`           | 云端服务器 |
| `dist-test/` | 测试环境 | `docker-compose.test.yml`, `Dockerfile.test` | 本地/云端  |

## 使用方式

### 1. 上传前端构建文件

将测试版本的前端构建产物上传到此目录。

### 2. 启动测试环境（本地或云端均可）

```bash
# 使用 Docker Compose (推荐)
docker compose -f docker-compose.test.yml up -d

# 或指定端口
HOST_PORT=8080 docker compose -f docker-compose.test.yml up -d
```

### 3. 停止服务

```bash
docker compose -f docker-compose.test.yml down
```

## 构建镜像

如需构建独立镜像:

```bash
docker build -f Dockerfile.test -t ice-frontend-test .
docker run -d -p 8080:80 --name ice-frontend-test ice-frontend-test
```
