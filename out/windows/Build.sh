#!/bin/bash
set -e

IMAGE_NAME=kap-builder-linux
OUTPUT_DIR=out/linux
BUILD_DIR=/home/builder/app/build

echo "[+] Building Docker image: $IMAGE_NAME"
docker build -f docker/Linux.dockerfile -t $IMAGE_NAME .

echo "[+] Running build inside container..."
docker run --rm \
  -v "$(pwd)":/home/builder/app \
  -w /home/builder/app \
  $IMAGE_NAME bash -c "
    conan install . --output-folder=build --build=missing &&
    cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/linux-clang.cmake -G Ninja &&
    cmake --build build
  "

echo "[+] Copying build output to $OUTPUT_DIR"
mkdir -p $OUTPUT_DIR
cp -r build/* $OUTPUT_DIR/
echo "[✓] Build complete."
