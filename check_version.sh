bash
FRP_DOCKER_TAGS_URL=https://hub.docker.com/v2/repositories/itodouble/frp/tags
DOCKER_VERSION=$(curl -s $FRP_DOCKER_TAGS_URL | jq -r '.results[1].name')

echo $DOCKER_VERSION
