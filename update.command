#!/usr/bin/env bash

set -ex

cd "$(dirname "$0")"

rm -rf Packages Packages.bz2
dpkg-scanpackages -m ./payloads > Packages
bzip2 -z Packages
