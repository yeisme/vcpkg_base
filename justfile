# justfile: https://github.com/casey/just
set dotenv-load := true
hot-ext := ".cpp,.h,.hpp,.c,.cc,.cxx,.json,.cmake,.env"

# 默认任务
default: help

# 显示帮助信息
help:
    @just --list

# 热加载开发
dev CC="clang" target="all":
    watchexec --timings -r -e {{hot-ext}} -- cmake --build --preset {{CC}}-debug-x64 --target {{target}}

# 清理构建目录
clean:
    rm -rf build/

# cmake 查看所有预设
list:
    @cmake --list-presets
    @cmake --build --list-presets
    @ctest --list-presets
