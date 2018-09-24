#! /bin/sh

source_path="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt-everywhere-opensource-src-5.9.4"
install_dir="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt_arm_lib"
host_dir="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt_host_binary"
tool_prefix="arm-linux-gnueabihf-"
cur_path=$(cd `dirname $0`;pwd)

export ZYNQ_QT_BUILD=$source_path/build
export ZYNQ_QT_INSTALL=$install_dir
export QT_SYSROOT=/opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi

rm -rf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
mkdir $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
cp $cur_path/qmake.conf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qmake.conf
cp $cur_path/qplatformdefs.h $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qplatformdefs.h
cd ${source_path}

./configure -device ${tool_prefix}g++ \
    -opensource \
    -confirm-license \
    -hostprefix ${host_dir} \
    -sysroot $install_dir \
    -prefix /usr/local/qt5 \
    -extprefix ${install_dir}/_rootfs \
    -release \
    -no-qml-debug \
    -reduce-relocations \
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
