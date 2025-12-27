# ============================================================
# ice-frontend 单阶段镜像（使用预构建的 dist 内容）
# 直接使用 nginx 提供静态文件服务
# ============================================================

FROM nginx:alpine

# 复制 nginx 配置
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 复制本地已构建好的静态资源（如存在）
COPY dist/ /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]
