FROM alpine:3
LABEL email="itodouble@outlook.com"

ENV GITHUB_REF_NAME main 

## ARG FRP_VERSION=0.50.0
ARG FRP_VERSION=$GITHUB_REF_NAME
ARG URL=https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz

## /usr/bin/{frps, frpc} -c xxx.ini
RUN mkdir -p /frp \
    && cd /frp\
    && wget -qO- ${URL} | tar xz \
    && mv frp_*/frpc /usr/bin/ \
    && mv frp_*/frps /usr/bin/ \
    && mv frp_*/*.ini ./ \
    && rm /frp -rf

VOLUME /config

ENV ARGS=frps CONFIG_FILE=frps

CMD /usr/bin/${ARGS} -c /config/${CONFIG_FILE}.ini
