cmake_minimum_required(VERSION 3.2)

set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR})

project(PROJECT_NAME)

add_compile_options(-Wall -Wextra -pedantic)

set(PROJECT_NAME_INSTALL_INCLUDE_DIR ${PROJECT_SOURCE_DIR})
set(PROJECT_NAME_INSTALL_BIN_DIR ${PROJECT_SOURCE_DIR}/bin)

set(PROJECT_NAME_HEADERS_DIR ${PROJECT_SOURCE_DIR})

include_directories(${PROJECT_NAME_INSTALL_INCLUDE_DIR})
include_directories(${PROJECT_NAME_HEADERS_DIR})

find_package (Threads)

file(GLOB SOURCE_FILES *.c *.cpp)
add_executable(PROJECT_NAME_EXE ${SOURCE_FILES})



add_library(PROJECT_NAME STATIC ${SOURCE_FILES})

target_link_libraries(PROJECT_NAME ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(PROJECT_NAME_EXE ${CMAKE_THREAD_LIBS_INIT})
add_subdirectory(test)
