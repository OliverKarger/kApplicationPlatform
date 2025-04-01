# docker/Linux.dockerfile

FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y \
    clang \
    ninja-build \
    cmake \
    git \
    python3-pip \
    curl \
    build-essential \
    libssl-dev

# Install Conan 2
RUN pip3 install conan==2.*

# Configure Conan
RUN conan config install --type git --url=https://github.com/conan-io/conan-config.git

# Set up user
RUN useradd -ms /bin/bash builder
USER builder
WORKDIR /home/builder/app
