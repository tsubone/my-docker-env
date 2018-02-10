#!/bin/bash

target=$1

WORK_TOP=`pwd`
SH_DIR=$(cd $(dirname $0) && pwd)

cd ${WORK_TOP}
BUILD_TOP=${WORK_TOP}/$target
rm -rf ${BUILD_TOP}
mkdir -p ${BUILD_TOP}
cd ${BUILD_TOP}

exec ${SH_DIR}/agl-utils/ee/BUILD_SCRIPTS/build_$target.sh
