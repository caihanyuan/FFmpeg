#!/bin/sh
NDK=/Users/hanyuan/android-ndk-r14b
SYSROOT=$NDK/platforms/android-21/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
CPU=armv7-a
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"
function build_android
{
./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --disable-static \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-avdevice \
    --disable-doc \
    --disable-symver \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
#make clean
#make -j 16
#make install
}
build_android