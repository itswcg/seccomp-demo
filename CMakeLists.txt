cmake_minimum_required(VERSION 3.16)
project(seccomp_demo)

set(CMAKE_CXX_STANDARD 11)

add_executable(seccomp_demo main.cpp)

target_link_libraries(seccomp_demo seccomp)