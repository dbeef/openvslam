#!/bin/sh

source common.sh
mkdir -p $OVSLAM_BUILD_DIR && cd $OVSLAM_BUILD_DIR

OPENCV_VERSION=4.5.4
download https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip -q -u ${OPENCV_VERSION}.zip
cd opencv-${OPENCV_VERSION}

cmake \
    -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${OVSLAM_DEPS_INSTALL_DIR} \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_dnn=OFF \
    -DBUILD_opencv_ml=OFF \
    -DBUILD_opencv_python_bindings_generator=OFF \
    -DENABLE_CXX11=ON \
    -DENABLE_FAST_MATH=ON \
    -DWITH_EIGEN=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_OPENMP=OFF

cmake --build build --target install --config Release -j${OVSLAM_THREAD_COUNT}

