#! /bin/sh

source_path="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt-everywhere-opensource-src-5.4.2"
install_dir="/home/zhangbo/zedboard/git-workspace/mk_rootfs/_rootfs"
tool_prefix="arm-linux-gnueabihf-"
cur_path=$(cd `dirname $0`;pwd)

export ZYNQ_QT_BUILD=$source_path/build
export ZYNQ_QT_INSTALL=$install_dir
#export ZYNQ_QT_BUILD=/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt-everywhere-opensource-src-5.4.2/build
#export ZYNQ_QT_INSTALL=/home/zhangbo/zedboard/git-workspace/mk_rootfs/qt_arm_lib
#export HOSTPREFIX=/home/zhangbo/zedboard/git-workspace/mk_rootfs/qt_host_binary
mkdir $source_path/qtbase/mkspecs/${tool_prefix}g++
cp $cur_path/qmake_5.4.2.conf $source_path/qtbase/mkspecs/${tool_prefix}g++/qmake.conf
cp $cur_path/qplatformdefs_5.4.2.h $source_path/qtbase/mkspecs/${tool_prefix}g++/qplatformdefs.h
cd ${source_path}

./configure -xplatform ${tool_prefix}g++ \
    -opensource \
    -confirm-license \
    -hostprefix /home/zhangbo/zedboard/git-workspace/mk_rootfs/qt_host_binary \
    -nomake examples \
    -skip qtquickcontrols \
    -skip qtwebkit \
    -skip qtwebchannel \
    -skip qtactiveqt \
    -skip qtandroidextras \
    -skip qtdeclarative \
    -skip qtimageformats \
    -skip qtmacextras \
    -skip qtserialport \
    -skip qtx11extras \
    -skip qtxmlpatterns \
    -skip qtconnectivity \
    -skip qtdoc \
    -skip qtenginio \
    -skip qtgraphicaleffects \
    -skip qtlocation \
    -skip qtmultimedia \
    -skip qtquick1 \
    -skip qtsensors \
    -skip qttools \
    -skip qttranslations \
    -skip qtwayland \
    -skip qtwebchannel \
    -skip qtwebengine \
    -skip qtwebkit-examples \
    -skip qtwebsockets \
    -skip qtwinextras \
    -verbose \
    -no-gif \
    -no-libjpeg \
    -no-mtdev \
    -no-sql-db2 \
    -no-sql-ibase \
    -no-sql-mysql \
    -no-xcb \
    -qt-freetype \
    -no-fontconfig \
    -no-harfbuzz \
    -no-xinput2 \
    -no-xcb-xlib \
    -no-pulseaudio \
    -no-alsa \
    -no-gtkstyle \
    -no-nis \
    -no-cups \
    -no-iconv \
    -no-icu \
    -no-eglfs \
    -no-openssl \
    -prefix $ZYNQ_QT_INSTALL
