#!/bin/bash
cd "$(dirname "$0")" || exit 1
source ./test-utils.sh

# Template specific tests
check "node" node --version
check "npm" npm --version
check "build-essential" gcc --version
check "sudo" sudo true
check "user" [ "$(whoami)" = "node" ]
check "devcontainer-env" [ "${DEVCONTAINER}" = "true" ]

# Report result
reportResults
