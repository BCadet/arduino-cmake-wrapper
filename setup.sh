#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ARDUINO_VERSION=1.8.16

docker build \
    -t arduino-cmake:${ARDUINO_VERSION} \
    --build-arg ARDUINO_VERSION=${ARDUINO_VERSION} \
    ${SCRIPTPATH}
