#!/bin/sh

HOSTNAME="eu.gcr.io"
PROJECT="test-project-simple-api"
DOCKER_IMAGE="$HOSTNAME/$PROJECT/api-invoker"

gcloudcmd="docker run -ti --rm \
 -v $HOME/.config:/root/.config \
 -e GOOGLE_APPLICATION_CREDENTIALS="~/.config/gcloud/application_default_credentials.json" \
  alpine/gcloud:310.0.0 gcloud"

${gcloudcmd} --project $PROJECT auth login
${gcloudcmd} auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://$HOSTNAME

docker push $DOCKER_IMAGE
