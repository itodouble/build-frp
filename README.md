# frp-build

https://github.com/fatedier/frp docker 构建

使用方式
```
docker pull itodouble/frp:latest
```
服务端：
```
docker run -d \
    -e "ARGS=frps" \
    -e "CONFIG_FILE=frps.ini" \
    -v /data/frp/config/:/config/ \
    --net host \
    itodouble/frp
```

客户端
```
docker run -d \
    -e "ARGS=frpc" \
    -e "CONFIG_FILE=frpc.ini"
    -v /data/frp/config/:/config/ \
    itodouble/frp
```

更多使用技巧参考https://gofrp.org/docs/

## 说明
打标签触发`action` 在`action`中将版本写入`config.properties`文件 执行`generate_dockerfile.sh`生成`Dockerfile`然后推送到hub.docker.com
