FROM ubuntu:16.04

# Install all necessary build tools
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    git \
    autoconf \
    libtool \
    pkg-config \
    gperf \
    gettext \
    yasm \
    python-lxml \
    autopoint \
    docbook2x \
    wget \
    nasm \
    unzip

RUN mkdir -p /source/ffmpeg-android

# Copy the entire project 
COPY . /source/ffmpeg-android

# Update the modules 
RUN cd /source/ffmpeg-android && \
    ./init_update_libs.sh

# Build ffmpeg binaries 
RUN cd /source/ffmpeg-android && \
    ./android_build.sh
