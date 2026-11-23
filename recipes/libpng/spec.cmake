set(DEP_VERSION 1.6.50)

set(DEP_SOURCE_URL    "https://download.sourceforge.net/libpng/libpng-1.6.50.tar.xz")
set(DEP_SOURCE_SHA256 "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307")

set(DEP_DEPENDS zlib)

set(DEP_CMAKE_ARGS
    -DPNG_SHARED=ON
    -DPNG_STATIC=OFF
    -DPNG_FRAMEWORK=OFF
    -DPNG_TESTS=OFF
    -DPNG_TOOLS=OFF
)

# On Windows the x86_64 build may run on an ARM64 host; libpng's NEON
# detection then pulls in arm_neon.h while compiling with an x64 compiler.
if(BD_OS STREQUAL "windows" AND NOT BD_ARCH STREQUAL "aarch64")
    list(APPEND DEP_CMAKE_ARGS -DPNG_ARM_NEON=off)
endif()
set(DEP_CMAKE_ARGS_WASM
    -DPNG_SHARED=OFF
    -DPNG_STATIC=ON
    -DPNG_FRAMEWORK=OFF
    -DPNG_TESTS=OFF
    -DPNG_TOOLS=OFF
)

# libpng 1.6 is not universal binary compatible
# here we make it prefer arm optimizations instead of intel's
# this is fixed in upcoming 1.8, but not in 1.6
# https://github.com/pnggroup/libpng/issues/372
set(DEP_PATCHES patch/0001-cmake-universal-macos-prefer-neon.patch)

set(DEP_LICENSE_FILES LICENSE)
