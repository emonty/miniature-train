#!/bin/bash

GCLOUD_PROJECT_ID=$(gcloud config get-value core/project)

if [[ "$GCLOUD_PROJECT_ID" = "(unset)" ]]; then
    echo "Please set a gcloud project"
    echo
    echo "  gcloud config set project my-awesome-project-123456"
    echo
    exit 1
fi

pushd ara
docker build . -t gcr.io/$GCLOUD_PROJECT_ID/ara
popd
pushd ara-web
# Cloning in this script is gross, but this is an exercise.
# There are ways we'd do this much differently if this was
# for real, but the relative cost of those for a one-time
# thing is not worth it.
if [[ ! -d ara-web ]] ; then
  git clone https://opendev.org/recordsansible/ara-web
fi
docker build . -t gcr.io/$GCLOUD_PROJECT_ID/ara-web
