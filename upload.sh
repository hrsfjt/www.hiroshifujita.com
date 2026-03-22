#!/bin/zsh
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ -z "${BUCKET_NAME:-}" ]]; then
  echo "Error: BUCKET_NAME is not set or empty." >&2
  exit 1
fi

aws s3 rm "s3://${BUCKET_NAME}/" --recursive
aws s3 sync "${SCRIPT_DIR}/public/" "s3://${BUCKET_NAME}/"
