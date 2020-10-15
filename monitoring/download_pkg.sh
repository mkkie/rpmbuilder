#!/bin/bash

# == Promethues ==
# https://github.com/prometheus/prometheus/releases/download/v2.21.0/prometheus-2.21.0.linux-arm64.tar.gz
# == AlertManager ==
# https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-arm64.tar.gz
# == NodeExporter ==
# https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-arm64.tar.gz
# Package URLs
PKG_URL_PREFIX="https://github.com/prometheus"
PKG_ARCH="linux-arm64"

# package_name = package_verion (without 'v')
prometheus=2.21.0
alertmanager=0.21.0
node_exporter=1.0.1

# Go to the right directory
if [ "$(dirname ${0})" != "." ]; then
  cd "$(dirname ${0})"
fi

# Download packages
mkdir -p pkg
for pkg in prometheus alertmanager node_exporter; do
  if [ -e "pkg/${pkg}-${!pkg}.${PKG_ARCH}.tar.gz" ]; then
    continue
  else
    wget "${PKG_URL_PREFIX}/${pkg}/releases/download/v${!pkg}/${pkg}-${!pkg}.${PKG_ARCH}.tar.gz" -P pkg
  fi
done

# Unpackage
for pkg in prometheus alertmanager node_exporter; do
  if [ -d "pkg/${pkg}-${!pkg}.${PKG_ARCH}" ]; then
    continue
  else
    tar zxvf pkg/${pkg}-${!pkg}.${PKG_ARCH}.tar.gz -C pkg
  fi
done

echo "done!"
