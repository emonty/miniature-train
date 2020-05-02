#!/bin/bash

GCLOUD_PROJECT_ID=$(gcloud config get-value core/project)

if [[ "$GCLOUD_PROJECT_ID" = "(unset)" ]]; then
    echo "Please set a gcloud project"
    echo
    echo "  gcloud config set project my-awesome-project-123456"
    echo
    exit 1
fi
