# CMake 模块接口文件
# 用于加载所有需要的 CMake 模块

# 包含核心配置
include(${CMAKE_CURRENT_LIST_DIR}/CoreConfig.cmake)

# 包含编译器选项
include(${CMAKE_CURRENT_LIST_DIR}/CompilerOptions.cmake)

# 包含包查找模块
include(${CMAKE_CURRENT_LIST_DIR}/FindPackages.cmake)

# 在这里可以添加更多模块的包含
# include(${CMAKE_CURRENT_LIST_DIR}/AdditionalModule.cmake)
message(STATUS "CMake 模块已加载")
