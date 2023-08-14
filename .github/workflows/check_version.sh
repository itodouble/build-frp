#!/bin/bash
#
#wget -O frp_latest.json  https://api.github.com/repos/fatedier/frp/releases/latest

FRP_VERSION_FULL=`curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'`
FRP_VERSION=${FRP_VERSION_FULL#v}

BUILD_VERSION_FULL=`curl --silent "https://api.github.com/repos/itodouble/frp-build/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'`
if [ ${FRP_VERSION} != ${BUILD_VERSION_FULL} ]
then
	bash generate_dockerfile.sh ${FRP_VERSION}
fi
