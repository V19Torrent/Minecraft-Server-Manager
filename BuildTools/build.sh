#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t mc-build-tools .

VERSION="latest"
if [ -n "$1" ]; then
    VERSION=$1
fi

# Create and run the image to build the server.jar
CID=$(docker run -d --mount type=bind,src=$SCRIPT_DIR/output,target=/opt/output \
    -e VERSION="$VERSION" \
    mc-build-tools)

docker attach $CID
docker rm $CID

docker image rm mc-build-tools
