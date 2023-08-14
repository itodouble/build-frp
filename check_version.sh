bash

DOCKER_VERSION=`curl -s https://registry.hub.docker.com/v1/repositories/itodouble/frp/tags | jq -r '.[].name' | sort -V | tail -n 1`
echo $DOCKER_VERSION
