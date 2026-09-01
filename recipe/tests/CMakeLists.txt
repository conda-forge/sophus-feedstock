cmake_minimum_required(VERSION 3.15)
project(test_sophus LANGUAGES CXX)

find_package(Sophus CONFIG REQUIRED)

add_executable(test_sophus test.cpp)
target_compile_features(test_sophus PRIVATE cxx_std_17)
target_link_libraries(test_sophus PRIVATE Sophus::Sophus)

enable_testing()
add_test(NAME test_sophus COMMAND test_sophus)
