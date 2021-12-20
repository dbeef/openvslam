#!/bin/sh

source common.sh

./1-prerequisites.sh
./2-build-eigen.sh
./3-build-g2o.sh
./4-build-opencv.sh
./5-build-pangolin.sh
./6-build-openvslam.sh

echo "$0 Success"

