#! /bin/sh

source_path="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt-everywhere-opensource-src-5.9.4"
install_dir="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt_arm_lib/_rootfs"
host_bin_dir="/home/zhangbo/zedboard/git-workspace/mk_rootfs/build_qt_lib/qt_host_binary"

tool_prefix="arm-linux-gnueabihf-"
cur_path=$(cd `dirname $0`;pwd)

export ZYNQ_QT_BUILD=$source_path/build
export ZYNQ_QT_INSTALL=$install_dir
rm -rf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
mkdir $source_path/qtbase/mkspecs/devices/${tool_prefix}g++
cp $cur_path/qmake_5.9.4.conf $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qmake.conf
cp $cur_path/qplatformdefs_5.9.4.h $source_path/qtbase/mkspecs/devices/${tool_prefix}g++/qplatformdefs.h
cd ${source_path}

source /opt/Xilinx/SDK/2018.1/settings64.sh
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm

read -p "Run 'confclean'? (y/n) "
if [ "$REPLY" == "y" ]; then
        make clean
fi 
 
./configure -device ${tool_prefix}g++ \
    -device-option CROSS_COMPILE=arm-linux-gnueabihf- \
    -prefix /usr/local/qt5  \
    -hostprefix ${host_bin_dir} \
    -extprefix $ZYNQ_QT_INSTALL \
    -release \
    -confirm-license \
    -opensource \
    -nomake examples \
    -skip qtquickcontrols \
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
    -no-cups \
    -no-iconv \
    -no-icu \
    -no-eglfs \
    -no-openssl
 
read -p "Run 'gmake'? (y/n) "
if [ "$REPLY" == "y" ]; then
    cd ${source_path}
    make
fi
 
read -p "Run 'gmake install'? (y/n) "
if [ "$REPLY" == "y" ]; then
    cd ${source_path}
    make install
fi
