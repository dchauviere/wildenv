#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/wildenv.lib.sh"

pip_install esphome
ln -s "${WILDENV_ROOT_DIR}/python/bin/esphome" "${WILDENV_ROOT_DIR}/bin/esphome"
