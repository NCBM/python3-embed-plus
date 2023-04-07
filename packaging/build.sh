#!/usr/bin/env bash

set -e

VERSION="$1" # 3.8.10, 3.10.11

# Get minor
VER_MINOR="${VERSION:2:2}"
if [[ "${VER_MINOR[2]}" == "." ]]; then
    VER_MINOR="${VERSION:2:1}"
fi

cd ./packaging                              # pwd: PROJECT/packaging
mkdir -p "$VERSION"
cd "$VERSION"                               # pwd: PROJECT/packaging/VERSION

# Download embeddable Python
EPY_FN="python-$VERSION-embed-amd64.zip"
[[ -e "$EPY_FN" ]] || wget "https://www.python.org/ftp/python/$VERSION/$EPY_FN"

# Unpack

## Unpack Tcl/Tk libs
unzip ../vendor/tcltk.zip

## Unpack Python
mkdir -p python
cd python                                   # pwd: PROJECT/packaging/VERSION/python
unzip ../"$EPY_FN"
rm -f ../"$EPY_FN"
unzip ../../vendor/3."$VER_MINOR"/inject.zip

## Install Tkinter
cp ../../vendor/{tcl,tk}86t.dll .
cp ../../vendor/3."$VER_MINOR"/_tkinter.pyd .
zip -mr ./python3"$VER_MINOR".zip ./tkinter

## Install venv
# cp python{,w}.exe ./venv-scripts/nt/
cp python.exe venvlauncher.exe
cp pythonw.exe venvwlauncher.exe
zip -mr ./python3"$VER_MINOR".zip ./venv
