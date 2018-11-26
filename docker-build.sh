#!/bin/bash
set -eo pipefail
SHA=$(git rev-parse --short HEAD)
IMAGE="nextjournal/fabio"
TAG="${IMAGE}:$SHA"
CONSUL_VERSION=1.3.0
VAULT_VERSION=0.11.4

docker build \
  --build-arg consul_version=$CONSUL_VERSION \
  --build-arg vault_verson=$VAULT_VERSION \
  -t $TAG \
  -f Dockerfile \
  .

docker push $TAG
