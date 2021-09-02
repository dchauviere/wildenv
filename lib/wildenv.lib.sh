#!/bin/bash

function pip_install() {
  local _pkgs=( "$@" )
  . "${WILDENV_ROOT_DIR}/python/bin/activate"
  pip install "${_pkgs[@]}"
  deactivate
}
