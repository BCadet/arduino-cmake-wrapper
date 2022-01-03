#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "${0}")" >/dev/null 2>&1 ; pwd -P )"

export ARDUINO_VERSION=1.8.16
export TOOLS_PATH=${SCRIPTPATH}/tools
export CMAKE_TOOLCHAIN_FILE=${TOOLS_PATH}/Arduino-CMake-Toolchain/Arduino-toolchain.cmake
export ARDUINO_INSTALL_PATH=${TOOLS_PATH}/arduino-${ARDUINO_VERSION}
export ARDUINO_BOARD_OPTIONS_FILE=${SCRIPTPATH}/cmake_wrapper/BoardOptions.cmake

echo "[*] Creating folders ${TOOLS_PATH} and ${SCRIPTPATH}/build"
cd ${SCRIPTPATH}
mkdir ${TOOLS_PATH}
mkdir ${SCRIPTPATH}/build
cd ${TOOLS_PATH}

echo "[*] Downloading tool arduino-${ARDUINO_VERSION} in ${TOOLS_PATH}"
wget -nc https://downloads.arduino.cc/arduino-${ARDUINO_VERSION}-linux64.tar.xz \
    && tar xf arduino-${ARDUINO_VERSION}-linux64.tar.xz
echo "[*] Done"

echo "[*] Downloading tool Arduino-CMake-Toolchain in ${TOOLS_PATH}"
git clone https://github.com/a9183756-gh/Arduino-CMake-Toolchain.git -b release-1.1-dev
echo "[*] Done"

cd  ${SCRIPTPATH}/build

cmake ${SCRIPTPATH}/cmake_wrapper

echo "[*] ${SCRIPTPATH}/build is ready !"
echo "[*] Configuration:"
echo "    - ARDUINO_VERSION = $ARDUINO_VERSION"
echo "    - CMAKE_TOOLCHAIN_FILE = $CMAKE_TOOLCHAIN_FILE"
echo "    - ARDUINO_INSTALL_PATH = $ARDUINO_INSTALL_PATH"
echo "    - ARDUINO_BOARD_OPTIONS_FILE = $ARDUINO_BOARD_OPTIONS_FILE"
