cmake_minimum_required(VERSION 3.10.0)
include(config.cmake)
project(HelloWorld CXX)

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/sketch
)

set(SRCS
    
)

set(INO
    ${CMAKE_CURRENT_LIST_DIR}/sketch/${CMAKE_PROJECT_NAME}.ino
)
# handle ino files
set_source_files_properties(${INO} PROPERTIES LANGUAGE "CXX") #this force cmake to call g++ with ino files
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -x c++") #this force g++ to build ino files as cpp files

add_executable(${CMAKE_PROJECT_NAME} ${SRCS} ${INO})

#auto link detected arduino standard libraries
target_link_arduino_libraries(${CMAKE_PROJECT_NAME} AUTO_PUBLIC)

# This is needed for the generation of HEX binary and uploading it
target_enable_arduino_upload(${CMAKE_PROJECT_NAME})

install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.elf
        ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_PROJECT_NAME}.bin
        DESTINATION
        ${CMAKE_CURRENT_LIST_DIR}/binaries
) #export built elf to cmake_wrapper/binaries