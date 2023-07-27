#!/bin/bash

if [[ "$target_platform" == "linux-64" ]]; then
    export CFLAGS="${CFLAGS} -lrt"
fi

if [[ "$target_platform" == linux-* ]]; then
    # Change austinp libraries from .a to .so
    sed -i 's,\.a,.so,g' configure.ac
fi

autoreconf --install
./configure --prefix=${PREFIX}

[[ "$target_platform" == "win-64" ]] && patch_libtool

make
make install
