#!/bin/bash

set -ex

while getopts ":i:r:t:" o; do
    case "${o}" in
        i)
            IMAGE_NAME=${OPTARG}
            ;;
        r)
            REGISTRY=${OPTARG}
            ;;
        t)
            TAG=${OPTARG}
            ;;
    esac
done
shift $((OPTIND-1))

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest-dnsutils $DIR