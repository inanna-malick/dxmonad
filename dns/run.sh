#!/bin/bash
set -e

docker run -d \
    --volumes-from dxmonad -e LOCAL_NAME=dnsmasq \
    --name=dnsmasq --net=host --privileged=true pkinsky/dnsmasq
