cmake_minimum_required(VERSION 3.29)
project(tests)

# set compiler flags
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions")

Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.6.0 # or a later release
)

# FetchContent_MakeAvailable(Catch2)
# find_package(Catch2 3 REQUIRED)
FetchContent_GetProperties(Catch2)
if(NOT catch2_POPULATED)
  FetchContent_Populate(Catch2)
  add_subdirectory(${catch2_SOURCE_DIR} ${catch2_BINARY_DIR})
endif()

# These tests can use the Catch2-provided main
add_executable(tests tests/test.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2WithMain)

# Build main
# add_compile_options("SHELL:-s NO_DISABLE_EXCEPTION_CATCHING=0")
add_executable(main src/main.cpp)
