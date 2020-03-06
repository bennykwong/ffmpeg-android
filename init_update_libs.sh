#!/bin/bash

echo "============================================"
echo "Updating submodules"
git submodule update --init
echo "============================================"
echo "Updating openh264"

rm -rf openh264-*

OPENH264_VERSION=2.0.0

wget -O- https://github.com/cisco/openh264/archive/v$OPENH264_VERSION.tar.gz | tar xz
echo "============================================"
