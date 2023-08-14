bash
DOCKER_IMAGE_INFO=$(curl -s https://hub.docker.com/v2/repositories/itodouble/frp/tags/)
echo ${DOCKER_IMAGE_INFO}
DOCKER_LATEST_INFO=$(jq '.results[1]' ${DOCKER_IMAGE_INFO})
echo ${DOCKER_LATEST_INFO}
DOCKER_VERSION=$(echo "$DOCKER_LATEST_INFO" | jq -r '.images[0].name')
echo $DOCKER_VERSION
