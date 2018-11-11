#!/usr/bin/env bash
set -e

# Get the version from the command line
VERSION=$1
if [ -z $VERSION ]; then
    echo "Please specify a version."
    exit 1
fi

# Get the parent directory of where this script is.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

# Change into that dir because we expect that
cd $DIR

@rm -rf dist && mkdir dist

# Make the checksums
echo "==> Signing..."
pushd ./dist
rm -f ./yamqe_${VERSION}_SHA256SUMS*
shasum -a256 * > ./yamqe_${VERSION}_SHA256SUMS
popd

# Upload


exit 0