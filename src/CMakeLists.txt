# 主项目源代码配置

# 源代码目录

# 添加可执行文件
add_executable(${PROJECT_NAME} main.cpp)

# 链接库
# target_link_libraries(${PROJECT_NAME} PRIVATE ...)

# 包含头文件目录
target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_SOURCE_DIR}/include
)
