
# 環境構築

```
docker buildx build . -f ./docker/php/Dockerfile -t test-php:base
docker buildx build ./docker/nginx -t test-nginx:base
```
