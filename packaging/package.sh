#!/usr/bin/env bash

set -e

VERSION="$1"
# ARCH="$2"
ARCH=amd64

# Get minor
VER_MINOR="${VERSION:2:2}"
if [[ "${VER_MINOR[2]}" == "." ]]; then
    VER_MINOR="${VERSION:2:1}"
fi

cd ./packaging/"$VERSION-$ARCH"             # pwd: PROJECT/packaging/VERSION-ARCH
zip -mr ../python-embed-plus-"$VERSION-$ARCH".zip *
cd ..                                       # pwd: PROJECT/packaging
rmdir ./"$VERSION-$ARCH"
