#!/bin/bash

sik_version=${PKG_VERSION}

mkdir -p "${PREFIX}/bin"
mkdir -p "${PREFIX}/rnasik-${sik_version}"
sed -i "s/src\/RNAsik.bds/rnasik-${sik_version}\/src\/RNAsik.bds/" bin/RNAsik
cp -r "bin" "${PREFIX}/rnasik-${sik_version}"
cp -r "src" "${PREFIX}/rnasik-${sik_version}"
cp -r "scripts" "${PREFIX}/rnasik-${sik_version}"
cp -r "configs" "${PREFIX}/rnasik-${sik_version}"
cp -r "supplementary" "${PREFIX}/rnasik-${sik_version}"
ln -s "${PREFIX}/rnasik-${sik_version}/bin/RNAsik" "${PREFIX}/bin/RNAsik"
