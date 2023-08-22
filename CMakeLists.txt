cmake_minimum_required(VERSION 3.10)
project(CameraStreamer)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(OpenCV REQUIRED)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GSTREAMER REQUIRED gstreamer-1.0)

# Include directories
include_directories(
    ${GSTREAMER_INCLUDE_DIRS}
)

# Add the executable
add_executable(CameraStreamer main.cpp)

# Link libraries
target_link_libraries(CameraStreamer
    ${OpenCV_LIBS}
    ${GSTREAMER_LIBRARIES}
)

# Set compile options
target_compile_options(CameraStreamer PRIVATE -Wall)

# Build the application using CMake
set(CMAKE_BUILD_TYPE Debug)  # Change this to Release for production
