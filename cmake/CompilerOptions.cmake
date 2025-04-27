# 设置编译器相关选项的函数

# 设置项目特定的编译器选项
# 这个函数应用于每个目标（库或可执行文件）
function(set_project_compiler_options target)
    # MSVC 选项
    if(MSVC)
        target_compile_options(${target} PRIVATE
            /MP # 多处理器编译，提高编译速度
            /permissive- # 严格的标准符合性
            /Zc:__cplusplus # 正确报告 C++ 版本
            $<$<CONFIG:Debug>:/JMC> # 仅我的代码调试，加快调试过程
        )

        if(ENABLE_WARNINGS)
            target_compile_options(${target} PRIVATE /W4) # 高级警告级别

            if(ENABLE_WARNINGS_AS_ERRORS)
                target_compile_options(${target} PRIVATE /WX) # 警告视为错误
            endif()
        endif()

    # GCC/Clang
    else()
        target_compile_options(${target} PRIVATE
            -pipe
        )

        if(ENABLE_WARNINGS)
            target_compile_options(${target} PRIVATE
                -Wall # 启用所有警告
                -Wextra # 启用额外警告
                -Wpedantic # 严格遵循标准
            )

            if(ENABLE_WARNINGS_AS_ERRORS)
                target_compile_options(${target} PRIVATE -Werror) # 警告视为错误
            endif()
        endif()
    endif()
endfunction()
