#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "${S3_BUCKET}" ]; then
    echo "S3_BUCKET environment variable must be set"
    exit -1
fi

aws s3 sync \
    --delete \
    --storage-class REDUCED_REDUNDANCY \
    --exclude "*" \
    --include "*.json" --include "*.html" \
    --include "*.css" --include "*.ico" \
    "${SCRIPT_DIR}/.." "s3://${S3_BUCKET}"
