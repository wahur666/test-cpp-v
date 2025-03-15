cmake_minimum_required(VERSION 3.30)
project(test_cpp_v)

set(CMAKE_CXX_STANDARD 20)

add_executable(test_cpp_v main.cpp)

target_link_libraries(test_cpp_v PRIVATE libv)

target_include_directories(test_cpp_v PRIVATE ${CMAKE_SOURCE_DIR}/libv)