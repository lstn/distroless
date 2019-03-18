#!/bin/bash

set -ex

IMAGE_NAME="lestienne/distroless-ruby"
TAG="$( dirname "${BASH_SOURCE[0]}" | cut -c 3-)"
REGISTRY="myprivateregistry.ca"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest $DIR
docker push ${REGISTRY}/${IMAGE_NAME}