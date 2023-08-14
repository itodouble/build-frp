bash
FRP_DOCKER_TAGS_URL=https://hub.docker.com/v2/repositories/itodouble/frp/tags
DOCKER_VERSION=$(curl -s $FRP_DOCKER_TAGS_URL | jq -r '.results[1].name')

FRP_VERSION_FULL=`curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'`
FRP_VERSION=${FRP_VERSION_FULL#v}

if [ ${FRP_VERSION} != ${DOCKER_VERSION} ]
then
    ./generate_dockerfile.sh ${FRP_VERSION}
    
fi
