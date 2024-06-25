#!/bin/bash

set -euxo pipefail

if [[ "${target_platform}" == osx-* ]]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

cmake $SRC_DIR \
      ${CMAKE_ARGS} \
      -G Ninja \
      -B build \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SOPHUS_TESTS=ON
cmake --build build --parallel
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
  ctest --test-dir build --output-on-failure
fi
cmake --build build --target install
