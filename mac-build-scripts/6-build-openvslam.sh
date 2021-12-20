#!/bin/sh

source common.sh

PATCH_PATH=$PWD/openvslam-m1-adjustments.patch
mkdir -p $OVSLAM_BUILD_DIR && cd $OVSLAM_BUILD_DIR

if ! [ -d openvslam ]; then
    git clone https://github.com/OpenVSLAM-Community/openvslam --recursive
    cd openvslam
    git apply $PATCH_PATH
else
    echo "openvslam already cloned"
    cd openvslam
fi

cmake \
    -B build -S . \
    -DCMAKE_PREFIX_PATH=$OVSLAM_DEPS_INSTALL_DIR \
    -DUSE_PANGOLIN_VIEWER=ON \
    -DBUILD_EXAMPLES=ON \
    -DUSE_STACK_TRACE_LOGGER=ON \
    -DCMAKE_INSTALL_PREFIX=$OVSLAM_INSTALL_DIR

cmake --build build --target install --config Release -j${OVSLAM_THREAD_COUNT}

