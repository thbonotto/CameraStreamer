# Use an official Ubuntu as a parent image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /app

# Install build tools and dependencies
RUN apt-get update && apt-get install -y \
    build-essential cmake \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    libopencv-dev x11vnc xvfb

# Copy the source code
COPY . /app

# Build the application using CMake
RUN mkdir build && cd build && cmake .. && make
RUN echo "exec /app/build/CameraStreamer" > ~/.xinitrc && chmod +x ~/.xinitrc
CMD ["x11vnc", "-create", "-forever"]
