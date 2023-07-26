#!/bin/bash

if [[ "$target_platform" == "linux-64" ]]; then
    export CFLAGS="${CFLAGS} -lrt"
fi


autoreconf --install
./configure --prefix=${PREFIX}

[[ "$target_platform" == "win-64" ]] && patch_libtool

make
make install

if [[ "$target_platform" == linux-* ]]; then
    $CC -O3 -Wall -pthread src/*.c -DAUSTINP -lunwind-ptrace -lunwind-generic -lbfd -o $PREFIX/bin/austinp
fi
