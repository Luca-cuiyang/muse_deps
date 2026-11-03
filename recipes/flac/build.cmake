if(BD_OS STREQUAL "wasm")
    foreach(_prefix ${BD_DEPENDS_PREFIXES})
        if(EXISTS "${_prefix}/lib/libogg.a")
            list(APPEND DEP_CMAKE_ARGS
                "-DOGG_INCLUDE_DIR=${_prefix}/include"
                "-DOGG_LIBRARY=${_prefix}/lib/libogg.a"
            )
            break()
        endif()
    endforeach()
endif()

_bd_cmake_build("${SRC}")
