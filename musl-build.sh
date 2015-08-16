cd build/ROOT || exit 1
ROOTDIR=`pwd`
cd ../musl || exit 1
cd include || exit 1
patch <<EOF || exit 1
diff --git a/include/assert.h b/include/assert.h
index 1ee02a4..6cb6ecf 100644
--- a/include/assert.h
+++ b/include/assert.h
@@ -16,7 +16,7 @@
 extern "C" {
 #endif
 
-void __assert_fail (const char *, const char *, int, const char *);
+void __assert_fail (const char *, const char *, int, const char *) __attribute__ ((__noreturn__));
 
 #ifdef __cplusplus
 }
EOF
cd .. || exit 1
./configure --prefix=$ROOTDIR || exit 1
make -j8 || exit 1
make install || exit 1
cd $ROOTDIR/lib || exit 1
ln -s libc.so ld-musl-x86_64.so.1 || exit 1
