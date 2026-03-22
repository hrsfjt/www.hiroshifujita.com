#!/bin/zsh
SCRIPT_DIR="$(cd $(dirname $0) && pwd)"

aws s3 rm s3://${BUCKET_NAME}/ --recursive
aws s3 sync ${SCRIPT_DIR}/public/ s3://${BUCKET_NAME}/
