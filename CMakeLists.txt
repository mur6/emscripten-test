cmake_minimum_required(VERSION 3.29)
project(tests)

Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.6.0 # or a later release
)

FetchContent_MakeAvailable(Catch2)

find_package(Catch2 3 REQUIRED)
# These tests can use the Catch2-provided main
add_executable(tests tests/test.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)
