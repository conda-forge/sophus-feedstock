@echo on

cmake %SRC_DIR% ^
  -B build ^
  -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_CXX_FLAGS="/EHsc /Zm200 /bigobj" ^
  -DBUILD_SOPHUS_TESTS=ON

cmake --build build --config Release

ctest --test-dir build --output-on-failure --build-config Release

cmake --build build --target install --config Release
