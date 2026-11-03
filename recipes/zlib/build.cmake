if(BD_OS STREQUAL "wasm")
    file(READ "${SRC}/CMakeLists.txt" _cmake)
    string(REGEX REPLACE
        "add_library\\(zlib SHARED[^\\n]*\\)\\n"
        ""
        _cmake "${_cmake}")
    string(REGEX REPLACE
        "target_include_directories\\(zlib PUBLIC[^\\n]*\\)\\n"
        ""
        _cmake "${_cmake}")
    string(REGEX REPLACE
        "set_target_properties\\(zlib PROPERTIES[^\\n]*\\)\\n"
        ""
        _cmake "${_cmake}")
    string(REPLACE
        "set_target_properties(zlib zlibstatic PROPERTIES OUTPUT_NAME z)"
        "set_target_properties(zlibstatic PROPERTIES OUTPUT_NAME z)"
        _cmake "${_cmake}")
    string(REPLACE
        "install(TARGETS zlib zlibstatic"
        "install(TARGETS zlibstatic"
        _cmake "${_cmake}")
    file(WRITE "${SRC}/CMakeLists.txt" "${_cmake}")
endif()

_bd_cmake_build("${SRC}")
