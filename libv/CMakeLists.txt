cmake_minimum_required(VERSION 3.30)
project(libv)

set(CMAKE_C_STANDARD 23)

if(WIN32)
    set(BUILD_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/build.ps1")
    add_custom_command(
            OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/build_script_executed
            COMMAND powershell -ExecutionPolicy Bypass -File "${BUILD_SCRIPT}"
            COMMENT "Running build.ps1 pre-build step for libv"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            VERBATIM
    )
else()
    set(BUILD_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/build.sh")
    add_custom_command(
            OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/build_script_executed
            COMMAND sh "${BUILD_SCRIPT}"
            COMMENT "Running build.sh pre-build step for libv"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            VERBATIM
    )
endif()

add_custom_target(pre_build_step DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/build_script_executed)

add_library(libv out/libv.c)

add_dependencies(libv pre_build_step)

set_target_properties(libv PROPERTIES OUTPUT_NAME "v")