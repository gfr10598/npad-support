#!/bin/bash
set -x
set -e

# Add gcloud to PATH.
source "${HOME}/google-cloud-sdk/path.bash.inc"

# All operations are performed as the service account named in KEYFILE.
# For all options see:
# https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account
gcloud auth activate-service-account --key-file "${KEYFILE}"

gsutil cp slicebase-i386/i686/*.rpm gs://legacy-rpms-mlab-sandbox
exit 0
