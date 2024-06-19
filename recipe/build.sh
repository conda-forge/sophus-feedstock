mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DBUILD_SOPHUS_TESTS=ON \
      ..
make -j${CPU_COUNT}
make test
make install
