#!/bin/sh

dotnetcmd="docker run -ti --rm \
  mcr.microsoft.com/dotnet/sdk:5.0 dotnet"

DOCKER_IMAGE="eu.gcr.io/test-project-simple-api/api-invoker"

docker build --cache-from $DOCKER_IMAGE -t $DOCKER_IMAGE .