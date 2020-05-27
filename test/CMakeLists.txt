cmake_minimum_required(VERSION 3.2)
project(PROJECT_NAME_tests)

include_directories(${PROJECT_NAME_HEADERS_DIR}
  ${PROJECT_SOURCE_DIR}/test/)

set(SOURCE_FILES TestMain.cpp)

add_executable(PROJECT_NAME_tests ${SOURCE_FILES})

set_target_properties (PROJECT_NAME_tests PROPERTIES LINK_FLAGS "-Wall")

target_link_libraries(PROJECT_NAME_tests PROJECT_NAME)
