#!/bin/sh
if [ $# -eq 0 ]; then
    docker build -f Dockerfile_miricle_devel -t miriec/miricle_devel:latest .
else
    docker build --build-arg version=$1 -f Dockerfile_miricle_devel -t miriec/miricle_devel:$1 .
fi