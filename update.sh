#!/usr/bin/env bash

set -ex

cd "$(dirname "$0")"

rm -r Release Release.bz2 || true
rm -r Packages Packages.bz2 || true

dpkg-scanpackages -m ./payloads > Packages
bzip2 -zk Packages

apt-ftparchive release -c ./resources/repo.conf . > Release
bzip2 -zk Release
