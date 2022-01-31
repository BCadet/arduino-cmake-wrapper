FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    cmake \
    wget \
    xz-utils \
    gosu

ARG ARDUINO_VERSION=1.8.16

RUN wget -P /opt https://downloads.arduino.cc/arduino-${ARDUINO_VERSION}-linux64.tar.xz \
    && tar -C /opt -xf /opt/arduino-${ARDUINO_VERSION}-linux64.tar.xz

RUN git clone https://github.com/a9183756-gh/Arduino-CMake-Toolchain.git -b release-1.1-dev /opt/Arduino-CMake-Toolchain

ENV CMAKE_TOOLCHAIN_FILE=/opt/Arduino-CMake-Toolchain/Arduino-toolchain.cmake
ENV ARDUINO_INSTALL_PATH=/opt/arduino-${ARDUINO_VERSION}
ENV ARDUINO_BOARD_OPTIONS_FILE=/cmake_wrapper/BoardOptions.cmake

ADD container-entrypoint /
RUN chmod +x /container-entrypoint
ENTRYPOINT ["/container-entrypoint"]