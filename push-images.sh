#!/bin/bash

source get-project-id.sh

for image in ara ara-web ; do
  docker push gcr.io/$GCLOUD_PROJECT_ID/$image
done
