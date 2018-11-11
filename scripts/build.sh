#!/usr/bin/env bash
set -e

# Get the version from the command line
VERSION=$1
if [ -z $VERSION ]; then
    echo "Please specify a version."
    exit 1
fi


echo $VERSION

#GOOS=linux GOARCH=amd64 go build -o build/linux-amd64/yamqe ./cmd/yamqe