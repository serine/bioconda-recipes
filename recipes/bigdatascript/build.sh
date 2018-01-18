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
curl "https://dl.google.com/go/go${GOLANG_VERSION}.${ARCH}.tar.gz" >"${GOTMP}/go.tar.gz"
tar xvzf "${GOTMP}/go.tar.gz" -C "${GOTMP}"

PATH="${PATH}:${GOTMP}/go/bin" BDS_HOME="${PREFIX}" scripts/install.sh

rm -rf "${GOTMP}"

mkdir -p "${PREFIX}/bin"
mkdir -p "${PREFIX}/etc"
mv "${PREFIX}/bds" "${PREFIX}/bin/bds"
mv "${PREFIX}/bds.config" "${PREFIX}/etc/bds.config"
chmod 0755 "${PREFIX}/bin/bds"
