#!/bin/sh
if [ $# -eq 0 ]; then
    docker build -f Dockerfile_miricle_stable -t miriec/miricle_stable:latest .
else
    docker build --build-arg version=$1 -f Dockerfile_miricle_stable -t miriec/miricle_stable:$1 .
fi