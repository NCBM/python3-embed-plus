#!/usr/bin/env bash

set -e

VERSION="$1"
# ARCH="$2"
ARCH=amd64

# # Get split version number
# VER_MAJOR=$(cut -d. -f1 <<< "${VERSION}")
# VER_MINOR=$(cut -d. -f2 <<< "${VERSION}")
# VER_PATCH=$(cut -d. -f3 <<< "${VERSION}")

cd ./packaging/"$VERSION-$ARCH"             # pwd: PROJECT/packaging/VERSION-ARCH
zip -mr ../python-embed-plus-"$VERSION-$ARCH".zip *
cd ..                                       # pwd: PROJECT/packaging
rmdir ./"$VERSION-$ARCH"
