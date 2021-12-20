#!/bin/sh

source common.sh

mkdir -p $OVSLAM_BUILD_DIR && cd $OVSLAM_BUILD_DIR

clone https://github.com/RainerKuemmerle/g2o

cd g2o
G2O_COMMIT=9b41a4ea5ade8e1250b9c1b279f3a9c098811b5a
git checkout ${G2O_COMMIT}

cmake \
    -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${OVSLAM_DEPS_INSTALL_DIR} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_UNITTESTS=OFF \
    -DG2O_USE_CHOLMOD=OFF \
    -DG2O_USE_CSPARSE=ON \
    -DG2O_USE_OPENGL=OFF \
    -DG2O_USE_OPENMP=OFF \
    -DG2O_BUILD_APPS=OFF \
    -DG2O_BUILD_EXAMPLES=OFF \
    -DG2O_BUILD_LINKED_APPS=OFF

cmake --build build --target install --config Release -j${OVSLAM_THREAD_COUNT}

