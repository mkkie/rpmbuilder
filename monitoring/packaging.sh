#!/bin/bash

# ARCH
PKG_ARCH="linux-arm64"

# package_name = package_verion (without 'v')
prometheus=2.21.0
alertmanager=0.21.0
node_exporter=1.0.1

# Go to the right directory
if [ "$(dirname ${0})" != "." ]; then
  cd "$(dirname ${0})"
fi

# Copy files
TARGET_DIR="pkg/monitoring"
mkdir -p "${TARGET_DIR}"

for pkg in prometheus alertmanager node_exporter; do
  [ -d "pkg/${pkg}-${!pkg}.${PKG_ARCH}" ] && [ ! -d "${TARGET_DIR}/${pkg}" ] \
   && mv "pkg/${pkg}-${!pkg}.${PKG_ARCH}" "${TARGET_DIR}/${pkg}"
done
/bin/cp -rf conf "${TARGET_DIR}/conf"

# Compress files
VERSION=1-0
cd pkg
tar zcvf monitoring-${VERSION}.tar.gz monitoring
cd ..

# Copy RPM Contents
mkdir -p ../rpmbuild/{BUILD,RPMS,SPECS,SOURCES,SRPMS}
/bin/cp -f monitoring.spec ../rpmbuild/SPECS/
/bin/cp -f pkg/monitoring-${VERSION}.tar.gz ../rpmbuild/SOURCES/

echo "done!"
