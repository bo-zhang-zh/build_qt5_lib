#! /bin/sh

cur_path=$(cd `dirname $0`;pwd)
source_path="${cur_path}/qt-everywhere-opensource-src-5.9.4"
install_dir="${cur_path}/qt_arm_lib"
host_dir="${cur_path}/qt_host_binary"
tool_prefix=$CROSS_COMPILE

#export ZYNQ_QT_BUILD=$source_path/build
#export ZYNQ_QT_INSTALL=$install_dir
#export QT_SYSROOT=/opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi

rm -rf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
mkdir -p $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
cp $cur_path/qmake-zynq.conf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qmake.conf
cp $cur_path/qplatformdefs-zynq.h $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qplatformdefs.h
cd ${source_path}

./configure -device ${tool_prefix}g++ \
    -opensource \
    -confirm-license \
    -hostprefix ${host_dir} \
    -prefix /usr/local/qt5 \
    -extprefix ${install_dir}/_rootfs \
    -release \
    -no-qml-debug \
    -qt-zlib \
    -qt-libpng \
    -qt-libjpeg \
    -qt-freetype \
    -qt-harfbuzz \
    -qt-pcre \
    -no-xcb \
    -qt-xkbcommon \
    -no-opengl \
    -no-eglfs \
    -no-kms \
    -no-icu \
    -no-pch \
    -verbose
