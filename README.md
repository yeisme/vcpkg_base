# CMake 项目模板

## 简介

这是一个现代化 C++ 项目的 CMake 模板，包含了一系列最佳实践和常用配置。

## 功能

- 现代 CMake 实践 (CMake 3.25+)
- CMakePresets 支持多配置
- 多平台支持 (Windows, Linux, macOS)
- 编译缓存支持 (ccache, sccache)
- 包管理支持 (vcpkg)

## 使用方法

### 环境要求

- CMake 3.30 或更高版本
- 支持 C++23 的现代编译器 (GCC 13+, Clang 16+, MSVC 2022+)
- just >= 1.40.0
- watchevec >= 2.3.0

### 配置和构建

使用 CMakePresets.json 来配置和构建项目:

```bash
cmake --build --list-presets
```

### 使用 just 替代 make

```bash
just -l
```
