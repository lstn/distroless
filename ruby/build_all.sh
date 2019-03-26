#!/bin/bash

IMAGE_NAME="lestienne/distroless-ruby"
REGISTRY="docker.io"
NOPUSH='false'

while getopts ":i:r:n:" o; do
    case "${o}" in
        i)
            IMAGE_NAME=${OPTARG}
            ;;
        r)
            REGISTRY=${OPTARG}
            ;;
        n)
            NOPUSH='true'
            ;;
    esac
done
shift $((OPTIND-1))

declare -a versions=(
    "2.4.5"
    "2.5.3"
    "2.5.5" "2.5.5-dnsutils"
    "2.6.0"
    "2.6.1" "2.6.1-dnsutils"
    "2.6.2" "2.6.2-dnsutils"
)

for v in "${versions[@]}"
do
    echo $v
    ./$v/build.sh -i "$IMAGE_NAME" -r "$REGISTRY" -t "$v"
done
if ${NOPUSH}; then
    echo "Not pushing to $REGISTRY"
else
    docker push ${REGISTRY}/${IMAGE_NAME}
fi
