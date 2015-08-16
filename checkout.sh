#!/bin/bash
mkdir build || exit 1
cd build || exit 1
git clone git://git.sv.gnu.org/coreutils --depth=1 || exit 1
git clone git://git.kernel.org/pub/scm/utils/dash/dash.git --depth=1 || exit 1
git clone git://git.musl-libc.org/musl --depth=1 || exit 1
mkdir ROOT || exit 1
