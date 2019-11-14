#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd openh264-2.0.0

ANDROID_PLATFROM_VERSION=android-21

make clean

case $1 in
  armeabi-v7a | armeabi-v7a-neon)
    HOST=arm-linux
  ;;
  arm64-v8a)
    HOST=aarch64-linux
  ;;
  x86)
    HOST=i686-linux
  ;;
  x86_64)
    HOST=x86_64-linux
  ;;
esac

# make -j12 PREFIX=${TOOLCHAIN_PREFIX} OS=android NDKROOT=${ANDROID_NDK} TARGET=${ANDROID_PLATFROM_VERSION} libraries install-static
# make OS=android NDKROOT=${ANDROID_NDK} TARGET=${ANDROID_PLATFROM_VERSION} NDKLEVEL=21 ARCH=arm64 libraries install || exit 1
make OS=android NDKROOT=/src/android-ndk-r14b ARCH=arm64 TARGET=android-21 NDKLEVEL=21 libraries install-static

popd
