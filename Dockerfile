FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    cmake \
    sudo \
    wget \
    xz-utils

#make an arduino user
RUN useradd -m arduino \
    && echo "arduino:arduino" | chpasswd \
    && adduser arduino sudo \
    && adduser arduino dialout

USER arduino
WORKDIR /home/arduino

ARG ARDUINO_VERSION=1.8.16

RUN wget https://downloads.arduino.cc/arduino-${ARDUINO_VERSION}-linux64.tar.xz \
    && tar xf arduino-${ARDUINO_VERSION}-linux64.tar.xz

RUN git clone https://github.com/a9183756-gh/Arduino-CMake-Toolchain.git -b release-1.1-dev

RUN mkdir build
WORKDIR /home/arduino/build

ENV CMAKE_TOOLCHAIN_FILE=/home/arduino/Arduino-CMake-Toolchain/Arduino-toolchain.cmake
ENV ARDUINO_INSTALL_PATH=/home/arduino/arduino-${ARDUINO_VERSION}
ENV ARDUINO_BOARD_OPTIONS_FILE=/home/arduino/cmake_wrapper/BoardOptions.cmake

RUN echo "cmake ../cmake_wrapper" >> /home/arduino/.bashrc
