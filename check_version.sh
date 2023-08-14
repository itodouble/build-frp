bash
DOCKER_IMAGE_INFO=$(curl -s https://registry.hub.docker.com/v1/repositories/itodouble/frp/tags)
echo ${DOCKER_IMAGE_INFO}
DOCKER_VERSION=${DOCKER_IMAGE_INFO} | jq -r '.tags[] | select(.name ~ /^v[0-9.]+$/) | .name' | sort -V | tail -n 1)
echo $DOCKER_VERSION
