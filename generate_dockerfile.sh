bash

FRP_VERSION=$1
echo "构建版本："${FRP_VERSION}

echo "FROM alpine:3" > Dockerfile
echo "LABEL email=\"itodouble@outlook.com\"" >> Dockerfile
echo "" >> Dockerfile
echo "RUN apk add --update" >> Dockerfile
echo "ARG FRP_VERSION=${GITHUB_REF_NAME}" >> Dockerfile
echo "ARG URL=https://github.com/fatedier/frp/releases/download/v\${FRP_VERSION}/frp_\${FRP_VERSION}_linux_amd64.tar.gz" >> Dockerfile
echo "" >> Dockerfile
echo "## /usr/bin/{frps, frpc} -c xxx.ini" >> Dockerfile
echo "RUN mkdir -p /frp /config \\" >> Dockerfile
echo "    && cd /frp\\" >> Dockerfile
echo "    && wget -qO- \${URL} | tar xz \\" >> Dockerfile
echo "    && mv frp_*/frpc /usr/bin/ \\" >> Dockerfile
echo "    && mv frp_*/frps /usr/bin/ \\" >> Dockerfile
echo "    && mv frp_*/*.ini /config/ \\" >> Dockerfile
echo "    && rm /frp -rf" >> Dockerfile

echo "VOLUME /config" >> Dockerfile

echo "ENV ARGS frps" >> Dockerfile
echo "ENV CONFIG_FILE frps.ini" >> Dockerfile
echo "ENV TZ Asia/Shanghai" >> Dockerfile

echo "CMD /usr/bin/\${ARGS} -c /config/\${CONFIG_FILE}" >> Dockerfile
