# frp-build
frp docker 构建
使用方式
```
docker pull itodouble/frp:latest
```
服务端：
```
docker run -d \
    -e "ARGS=frps" \
    -e "CONFIG_FILE=frps.ini" \
    -v /config/:/config/ \
    --net host \
    itodouble/frp
```

客户端
```
docker run -d \
    -e "ARGS=frpc" \
    -e "CONFIG_FILE=frpc.ini"
    -v /config/:/config/ \
    itodouble/frp
```
