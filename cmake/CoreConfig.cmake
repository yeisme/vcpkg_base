# 核心配置模块
# 包含 C++ 标准设置和基本构建选项

# C++ 标准配置
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 23) # 使用 C++23
set(CMAKE_CXX_STANDARD_REQUIRED ON) # 强制使用指定的标准
set(CMAKE_CXX_EXTENSIONS OFF) # 不使用编译器特定扩展

# vcpkg 配置
if(DEFINED ENV{VCPKG_ROOT})
    set(CMAKE_TOOLCHAIN_FILE $ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg 工具链文件")
    message(STATUS "使用 vcpkg 工具链文件: ${CMAKE_TOOLCHAIN_FILE}")
endif()

# 编译缓存配置
if(MSVC)
    # MSVC 编译器 - 使用内置的缓存和热重载功能
    message(STATUS "使用 MSVC 编译器，启用内置缓存功能")

    # 设置 PDB 文件路径，避免并行构建时的冲突
    set(CMAKE_PDB_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/pdb")
else()
    # 非 MSVC 编译器 - 尝试使用 sccache 或 ccache 加速编译
    set(CACHE_TOOLS scache ccache)

    foreach(TOOL ${CACHE_TOOLS})
        find_program(CACHE_EXECUTABLE ${TOOL})

        if(CACHE_EXECUTABLE)
            message(STATUS "Using ${TOOL} for compiler caching.")
            set(CMAKE_C_COMPILER_LAUNCHER "${CACHE_EXECUTABLE}")
            set(CMAKE_CXX_COMPILER_LAUNCHER "${CACHE_EXECUTABLE}")
            break()
        endif()
    endforeach()
endif()
