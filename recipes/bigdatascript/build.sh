#!/bin/bash

BDS_HOME="${PREFIX}/opt/bds" scripts/install.sh

mkdir -p "${PREFIX}/bin"
ln -s "${PREFIX}/opt/bds/bds" "${PREFIX}/bin/bds"
ln -s "${PREFIX}/opt/bds/bds.config" "${PREFIX}/bin/bds.config"
# Include 'clusterGeneric' HPC queue wrapper scripts not installed by default
cp -r config "${PREFIX}/opt/bds/"
# Update default bds.config to contain correct paths to 'clusterGeneric' wrapper scripts
sed -i 's/\~\/\.bds/'${PREFIX}'\/opt\/bds\/config/' "${PREFIX}/opt/bds/bds.config"
chmod 0755 "${PREFIX}/opt/bds/bds"
