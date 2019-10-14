#!/bin/bash

export C_INCLUDE_PATH=${PREFIX}/include
export LIBRARY_PATH=${PREFIX}/lib

cd src/
make
mkdir -p "${PREFIX}/bin"
ln -sf sabre "${PREFIX}/bin/"
