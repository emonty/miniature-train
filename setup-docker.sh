#!/bin/bash

source get-project-id.sh

KEY_FILE=$(pwd)/ara-deploy-key.json
IAM_ACCOUNT=ara-deploy@$GCLOUD_PROJECT_ID.iam.gserviceaccount.com

if [[ ! -f $KEY_FILE ]]; then
  gcloud iam service-accounts keys create $KEY_FILE --iam-account $IAM_ACCOUNT
fi
gcloud auth activate-service-account $IAM_ACCOUNT --key-file=$KEY_FILE
gcloud auth configure-docker gcr.io
