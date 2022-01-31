# setup environment variables
cmake_host_system_information(RESULT CMAKE_HOST_SYSTEM_PROCESSOR QUERY OS_PLATFORM)
cmake_host_system_information(RESULT CMAKE_HOST_SYSTEM_NAME QUERY OS_NAME)
set(CMAKE_TOOLCHAIN_FILE $ENV{CMAKE_TOOLCHAIN_FILE} CACHE INTERNAL "")
set(ARDUINO_INSTALL_PATH $ENV{ARDUINO_INSTALL_PATH} CACHE INTERNAL "")
set(ARDUINO_BOARD_OPTIONS_FILE $ENV{ARDUINO_BOARD_OPTIONS_FILE} CACHE INTERNAL "")
set(ARDUINO_PACKAGE_MANAGER_PATH "$ENV{HOME}/.arduino15" CACHE INTERNAL "")
set(ARDUINO_PKG_MGR_DL_CACHE "${ARDUINO_PACKAGE_MANAGER_PATH}/staging/packages" CACHE INTERNAL "")
get_filename_component(CMAKE_TOOLCHAIN_PATH ${CMAKE_TOOLCHAIN_FILE} DIRECTORY)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_TOOLCHAIN_PATH}")

# get arduino packages
include(Arduino/PackageManager/BoardsManager)
BoardManager_DownloadPackage(JSON_FILES_LIST _json_files "https://downloads.arduino.cc/packages/package_index.json")
IndexArduinoPackages("${_json_files}")
packages_find_platforms(platforms_list JSON_FILE _json_files)