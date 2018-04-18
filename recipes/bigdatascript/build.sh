#!/bin/bash
set -e
set -o pipefail
set -x

GOLANG_VERSION=1.9.2

# We download a throwaway Go compiler, just for the BDS build environment
if [ `uname` == Darwin ]; then
  ARCH=darwin-amd64
else
  ARCH=linux-amd64
fi

GOTMP=$(mktemp -d)
wget -O  "${GOTMP}/go.tar.gz" "https://dl.google.com/go/go${GOLANG_VERSION}.${ARCH}.tar.gz" || \
  curl "https://dl.google.com/go/go${GOLANG_VERSION}.${ARCH}.tar.gz" >"${GOTMP}/go.tar.gz"
tar xvzf "${GOTMP}/go.tar.gz" -C "${GOTMP}"

PATH="${PATH}:${GOTMP}/go/bin" BDS_HOME="${PREFIX}/bds" scripts/install.sh

rm -rf "${GOTMP}"

mkdir -p "${PREFIX}/bin"
ln -s "${PREFIX}/bds/bds" "${PREFIX}/bin/bds"
#This is tmp hack, for RNAsik to work. It needs bds.config next to bds exec
ln -s "${PREFIX}/bds/bds.config" "${PREFIX}/bin/bds.config"
chmod 0755 "${PREFIX}/bds/bds"
