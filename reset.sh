#!/bin/bash

# Go to the right directory
if [ "$(dirname ${0})" != "." ]; then
  cd "$(dirname ${0})"
fi

/bin/rm -rf rpmbuild
for dir in BUILD RPMS SPECS SOURCES SRPMS; do
  mkdir -p rpmbuild/"${dir}"
done

echo "done!"

