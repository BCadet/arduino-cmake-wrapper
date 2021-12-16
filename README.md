# CMAKE WRAPPER FOR ARDUINO SKETCH PROJECT

This repo contain the environment to build an arduino sketch with CMake.

## Usage

- put the sketch in `cmake_wrapper/sketch`
- fill the `CMakeLists.txt` fields `SRC` and `INO` with the `.cpp` files and the `.ino` file.
- define in the `BoardOptions.cmake` the arduno board you want to build to (if the arduino is not an avr standard, you need to provide the appropriate package platform in the `BoardManager_InstallPlatform` function).
- run `setup.sh` to build a docker image with the arduino-ide inside
- run build.sh to run into a container read to build your project.

## Commands available in the container

- **make**: build the sketch
- **make upload SERIAL_PORT_FILE=/dev/ttyACM0** : upload the sketch to an arduino (you need to provide the correct serial port in the variable SERIAL_PORT_FILE and share the serial port with the container by adding the arg `--device=/dev/ttyACM0` to the docker run command)
- **make install**: export the elf and bin files to the folder `cmake_wrapper/binaries`

## Dependencies

This wrapper in based on the [Arduino-CMake-Toolchain](https://github.com/a9183756-gh/Arduino-CMake-Toolchain) (the branch release-1.1-dev).  
By default, the arduino-ide version used is the 1.8.16.