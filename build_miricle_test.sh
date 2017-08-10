#!/bin/sh
if [ $# -eq 0 ]; then
    docker build -f Dockerfile_miricle_test -t miriec/miricle_test:latest .
else
    docker build --build-arg version=$1 -f Dockerfile_miricle_test -t miriec/miricle_test:$1 .
fi