#!/bin/bash

bds_version=${PKG_VERSION}
BDS_HOME="${PREFIX}/opt/bds-${bds_version}" scripts/install.sh

mkdir -p "${PREFIX}/bin"
mkdir -p "${PREFIX}/opt/bds-${bds_version}"
ln -s "${PREFIX}/opt/bds-${bds_version}/bds" "${PREFIX}/bin/bds"
ln -s "${PREFIX}/opt/bds-${bds_version}/bds.config" "${PREFIX}/bin/bds.config"
chmod 0755 "${PREFIX}/opt/bds-${bds_version}/bds"
