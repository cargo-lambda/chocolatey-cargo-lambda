#!/bin/bash

set -e

function choco {
  mono /opt/chocolatey/choco.exe "$@" --allow-unofficial --nocolor
}

## Determine the version to pack
if [[ -z ${VERSION} ]]; then
  exit "missing VERSION variable"
fi

if [[ -z ${AUTH_TOKEN} ]]; then
  exit "missing AUTH_TOKEN variable"
fi

echo "Packing version ${VERSION} of cargo-lambda"

mkdir -p target
choco pack cargo-lambda.nuspec --version ${VERSION} --out target
choco push target/cargo-lambda.${VERSION}.nupkg \
	--api-key ${AUTH_TOKEN} -s https://push.chocolatey.org/ --timeout 180
