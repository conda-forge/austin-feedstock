#!/bin/bash

if [[ "$target_platform" == "linux-64" ]]; then
    export CFLAGS="${CFLAGS} -lrt"
fi


autoreconf --install
./configure --prefix=${PREFIX}

[[ "$target_platform" == "win-64" ]] && patch_libtool

make
make install
