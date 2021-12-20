#!/bin/sh

# Exit on error:
set -e
# Using undefined variables is an error:
set -u

OVSLAM_BUILD_DIR=$PWD/build
OVSLAM_DEPS_INSTALL_DIR=$PWD/deps
OVSLAM_INSTALL_DIR=$PWD/install
OVSLAM_THREAD_COUNT=$(nproc)

download ()
{
    ADDR=$1
    OUT=$(echo $ADDR | rev | cut -d / -f 1 | rev)
    if ! [ -f "$OUT" ]; then
        wget -q $ADDR
    else
        echo "$OUT already downloaded"
    fi
}

clone ()
{
    ADDR=$1
    OUT=$(echo $ADDR | rev | cut -d / -f 1 | rev)
    if ! [ -d "$OUT" ]; then
        git clone $ADDR --recursive
    else
        echo "$OUT already cloned"
    fi
}

