#!/bin/sh

source common.sh

mkdir -p $OVSLAM_BUILD_DIR && cd $OVSLAM_BUILD_DIR

EIGEN3_VERSION=3.4.0
download https://gitlab.com/libeigen/eigen/-/archive/${EIGEN3_VERSION}/eigen-${EIGEN3_VERSION}.tar.bz2
tar xf eigen-${EIGEN3_VERSION}.tar.bz2
cd eigen-${EIGEN3_VERSION}

cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${OVSLAM_DEPS_INSTALL_DIR}

cmake --build build --target install --config Release -j${OVSLAM_THREAD_COUNT}

