bash

while read line;do  
    eval "$line"
    echo "$line"
done < config.propertis
echo ${GITHUB_REF_NAME}
echo ${{GITHUB_REF_NAME}}
echo "FROM alpine:3" > Dockerfile
echo "LABEL email=\"itodouble@outlook.com\"" >> Dockerfile
echo "" >> Dockerfile
echo "ARG FRP_VERSION=${{GITHUB_REF_NAME}}" >> Dockerfile
echo "ARG URL=https://github.com/fatedier/frp/releases/download/v\${FRP_VERSION}/frp_\${FRP_VERSION}_linux_amd64.tar.gz" >> Dockerfile
echo "" >> Dockerfile
echo "## /usr/bin/{frps, frpc} -c xxx.ini" >> Dockerfile
echo "RUN mkdir -p /frp \\" >> Dockerfile
echo "    && cd /frp\\" >> Dockerfile
echo "    && wget -qO- \${URL} | tar xz \\" >> Dockerfile
echo "    && mv frp_*/frpc /usr/bin/ \\" >> Dockerfile
echo "    && mv frp_*/frps /usr/bin/ \\" >> Dockerfile
echo "    && mv frp_*/*.ini ./ \\" >> Dockerfile
echo "    && rm /frp -rf" >> Dockerfile
echo "VOLUME /config" >> Dockerfile
echo "ENV ARGS=frps CONFIG_FILE=frps" >> Dockerfile
echo "CMD /usr/bin/\${ARGS} -c /config/\${CONFIG_FILE}.ini" >> Dockerfile
