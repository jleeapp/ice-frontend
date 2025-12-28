# ============================================================
# ice-frontend 镜像
# ============================================================

FROM nginx:latest

# 复制 nginx 配置
COPY nginx.conf /etc/nginx/nginx.conf

# 复制静态资源
COPY dist/ /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
