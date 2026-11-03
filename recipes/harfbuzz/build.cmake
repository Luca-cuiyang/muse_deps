if(BD_OS STREQUAL "wasm")
    foreach(_prefix ${BD_DEPENDS_PREFIXES})
        if(EXISTS "${_prefix}/lib/libfreetype.a")
            list(APPEND DEP_CMAKE_ARGS
                "-DFREETYPE_INCLUDE_DIRS=${_prefix}/include/freetype2"
                "-DFREETYPE_LIBRARY=${_prefix}/lib/libfreetype.a"
            )
            break()
        endif()
    endforeach()
endif()

_bd_cmake_build("${SRC}")
