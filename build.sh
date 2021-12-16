#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ARDUINO_VERSION=1.8.16

docker run -it --rm \
    -v ${SCRIPTPATH}/cmake_wrapper:/home/arduino/cmake_wrapper \
    arduino-cmake:${ARDUINO_VERSION} \
    $@
