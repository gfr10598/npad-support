#!/bin/bash
set -x
set -e

KEYFILE=${1:?Please provide the service account key file}
GSPATH=${2:?Please provide destination path - gs://path}

$TRAVIS_BUILD_DIR/travis/install_gcloud.sh

# Add gcloud to PATH.
source "${HOME}/google-cloud-sdk/path.bash.inc"

# All operations are performed as the service account named in KEYFILE.
# For all options see:
# https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account
gcloud auth activate-service-account --key-file "${KEYFILE}"

# For this to succeed, the specified bucket must have ACLs to allow W
# access for the service account associated with the keyfile.  This is
# arranged by executing, from a privileged account:
# gsutil acl ch -u legacy-rpm-writer@PROJECT.iam.gserviceaccount.com:W \
#  gs://BUCKET
gsutil cp slicebase-i386/i686/*.rpm gs://${GSPATH}/

exit 0
