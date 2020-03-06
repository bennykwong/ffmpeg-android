#!/bin/bash

echo "============================================"

echo "Updating submodules..."
git submodule update --init
echo "============================================"

echo "Updating openh264..."
rm -rf openh264-*
OPENH264_VERSION=2.0.0
wget -O- -q https://github.com/cisco/openh264/archive/v$OPENH264_VERSION.tar.gz | tar xz
echo "============================================"

echo "Updating Android NDK..."
rm -rf android-ndk-*
rm -rf /android-ndk-*
wget -q https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip
# 7z x android-ndk-r14b-linux-x86_64.zip -o/android-ndk-r14b
echo "============================================"

echo "Extracting Android NDK..."
unzip -q android-ndk-r14b-linux-x86_64.zip -d /android-ndk-r14b
export ANDROID_NDK=/android-ndk-r14b

echo "============================================"
