(./checkout.sh && ./musl-build.sh && ./coreutils-build.sh && ./dash-build.sh) || exit 1
echo "Build complete." 1>&2 || exit 1
