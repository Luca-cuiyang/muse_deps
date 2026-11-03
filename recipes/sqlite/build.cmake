if(BD_OS STREQUAL "windows" OR BD_OS STREQUAL "wasm")
    set(LIBTYPE STATIC)
    set(DEP_STATIC ON)
else()
    set(LIBTYPE SHARED)
endif()
configure_file("${BD_RECIPE_DIR}/CMakeLists.txt.in" "${SRC}/CMakeLists.txt" @ONLY)

_bd_cmake_build("${SRC}")
