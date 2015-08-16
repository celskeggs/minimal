cd build/ROOT || exit 1
ROOTDIR=`pwd`
cd ../dash || exit 1
./autogen.sh || exit 1
./configure --prefix=$ROOTDIR CC=$ROOTDIR/bin/musl-gcc --host x86_64-unknown-linux-gnueabi || exit 1
make -j8 || exit 1
make install || exit 1
