# dist 目录说明

请将已构建完成的前端静态文件复制到此目录下。

示例文件结构（参考）：

```
app-loading.css
assets/
detect-ie.js
favicon.ico
index.html
models/
```

注意：
- 本仓库的 Docker Compose 直接将 `./dist` 挂载到容器内 `/usr/share/nginx/html`。
- 不再进行在线构建（无 Node/Vite 构建流程），只提供静态内容。
- 如需更新内容，替换此目录中的文件后，重启容器即可生效。
