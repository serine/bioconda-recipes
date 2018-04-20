#!/bin/bash

BDS_HOME="${PREFIX}/opt/bds" scripts/install.sh

mkdir -p "${PREFIX}/bin"
ln -s "${PREFIX}/opt/bds/bds" "${PREFIX}/bin/bds"
ln -s "${PREFIX}/opt/bds/bds.config" "${PREFIX}/bin/bds.config"
chmod 0755 "${PREFIX}/opt/bds/bds"
