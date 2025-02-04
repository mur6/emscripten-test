cmake_minimum_required(VERSION 3.10.2)

project(simple-emscripten-cpp)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

string(APPEND CMAKE_EXE_LINKER_FLAGS " -s ALLOW_MEMORY_GROWTH=1")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -s MODULARIZE=1")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -s EXPORT_ES6=1")
string(APPEND CMAKE_EXE_LINKER_FLAGS " -lembind")
string(APPEND CMAKE_EXE_LINKER_FLAGS " --emit-tsd interface.d.ts")

if (SUPPORT_OPENCCV)
    find_package(OpenCV 3 REQUIRED)
endif()

# if (EMSCRIPTEN)
#     set(CMAKE_EXECUTABLE_SUFFIX ".html")
# endif()

add_executable(main src/main.cpp)

if (SUPPORT_OPENCCV)
    include_directories(
        ${OpenCV_INCLUDE_DIRS}
    )
    target_link_libraries(main  ${OpenCV_LIBS})
endif()
