#!/bin/bash

if [[ "$target_platform" == "linux-64" ]]; then
    export CFLAGS="${CFLAGS} -lrt"
fi

[[ "$target_platform" == "win-64" ]] && patch_libtool

autoreconf --install
./configure --prefix=${PREFIX}

make
make install

${PYTHON} -m pip install . -vv
