cd build/ROOT || exit 1
ROOTDIR=`pwd`
cd ../coreutils || exit 1
patch <<EOF || exit 1
diff --git a/Makefile.am b/Makefile.am
index fb4af27..003e113 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -214,5 +214,5 @@ AM_CPPFLAGS = -Ilib -I\$(top_srcdir)/lib -Isrc -I\$(top_srcdir)/src
 include \$(top_srcdir)/lib/local.mk
 include \$(top_srcdir)/src/local.mk
 include \$(top_srcdir)/doc/local.mk
-include \$(top_srcdir)/man/local.mk
+# include \$(top_srcdir)/man/local.mk
 include \$(top_srcdir)/tests/local.mk
EOF
./bootstrap || exit 1
./configure || exit 1
make -j8 || exit 1
cp src/make-prime-list ../make-prime-list-backup
./configure --prefix=$ROOTDIR CC=$ROOTDIR/bin/musl-gcc --host x86_64-unknown-linux-gnueabi || exit 1
make clean || exit 1
rm -f src/primes.h || exit 1
echo "The following should fail when making the prime list." 1>&2 || exit 1
make -j8 && exit 1
cp ../make-prime-list-backup src/make-prime-list
make -j8 || exit 1
make install || exit 1
