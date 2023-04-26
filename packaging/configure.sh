#!/usr/bin/env bash

set -e

VERSION="$1" # 3.8.10, 3.10.11, ...
# ARCH="$2" # win32, amd64
ARCH=amd64

# Get split version number
VER_MAJOR=$(cut -d. -f1 <<< "${VERSION}")
VER_MINOR=$(cut -d. -f2 <<< "${VERSION}")
VER_PATCH=$(cut -d. -f3 <<< "${VERSION}")

# Check and update args
CHKED_ARGS=$(getopt -o S -l setup-site-packages-dir -n configure.sh -- "$@")
eval set -- "$CHKED_ARGS"

# [[ -d "./packaging/$VERSION-$ARCH/python" ]] || exit 1

# cd "./packaging/$VERSION-$ARCH"/python      # pwd: PROJECT/packaging/VERSION-ARCH/python

setup_site_packages_dir() {
    echo "Lib/site-packages" >> python${VER_MAJOR}${VER_MINOR}._pth
}

while true; do
    case "$1" in
        -S|--setup-site-packages-dir)
            echo setup_site_packages_dir
            shift 1
            ;;
        --)
            break
            ;;
    esac
done
