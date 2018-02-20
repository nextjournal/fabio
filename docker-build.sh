#!/bin/bash
set -eo pipefail
SHA=$(git rev-parse --short HEAD)
IMAGE="nextjournal/fabio"
TAG="${IMAGE}:$SHA"
LATEST="${IMAGE}:latest"

cp ./build/ca-certificates.crt .

docker run --rm -v $(pwd):/go/src/github.com/fabiolb/fabio -w /go/src/github.com/fabiolb/fabio golang:1.10 make linux
docker build -t $TAG -f Dockerfile .
docker tag $TAG $LATEST
docker push $TAG
docker push $LATEST
