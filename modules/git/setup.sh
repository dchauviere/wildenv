#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/wildenv.lib.sh"

pip_install pre-commit
ln -s "${WILDENV_ROOT_DIR}/python/bin/pre-commit" "${WILDENV_ROOT_DIR}/bin/pre-commit"
