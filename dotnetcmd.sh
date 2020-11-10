#!/bin/sh

alias dotnetcore="docker run -ti --rm \
    -v "$(pwd)"/files/:/files/ \
  mcr.microsoft.com/dotnet/sdk:5.0 dotnet"

  dotnetcore $@
