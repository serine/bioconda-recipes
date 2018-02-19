#!/bin/bash

cp "${RECIPE_DIR}/RNAsik.sh" "${PREFIX}/bin/RNAsik"
sed -i 's/RNASIK_PATH/${SRC_DIR}/' "${PREFIX}/bin/RNAsik"
chmod 0755 "${PREFIX}/bin/RNAsik"
