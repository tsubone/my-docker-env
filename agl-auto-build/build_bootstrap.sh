#!/bin/bash

release=$1
machine=$2
revision=$3

echo "BUILD BOOT $release-$machine-$revision"

WORK_TOP=`pwd`
SH_DIR=$(cd $(dirname $0) && pwd)

cd ${WORK_TOP}
BUILD_TOP=${WORK_TOP}/agl/$machine-$release-$revision
rm -rf ${BUILD_TOP}
mkdir -p ${BUILD_TOP}
cd ${BUILD_TOP}

echo "exec ${SH_DIR}/agl-utils/BUILD_SCRIPTS/build_${release}_${machine}.sh $revision"

exec ${SH_DIR}/agl-utils/BUILD_SCRIPTS/build_${release}_${machine}.sh ${revision}
