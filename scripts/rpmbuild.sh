#!/bin/bash
TARGET=aarch64

for spec in $(ls /root/rpmbuild/SPECS); do
  rpmbuild -ba --target=${TARGET} /root/rpmbuild/SPECS/${spec}
done
