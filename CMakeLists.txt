cmake_minimum_required(VERSION 3.20)

# 定义项目名称、版本和使用的语言
project(HelloWorld VERSION 1.0 LANGUAGES CXX)

enable_testing()

# 添加 cmake 模块目录
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# 通过接口文件加载所有 CMake 模块
include(cmake/CMakeModule.cmake)

find_required_packages()

# add target or subdirectory
add_subdirectory(src)
