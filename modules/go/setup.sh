#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/wildenv.lib.sh"

mkdir -p "${WILDENV_ROOT_DIR}/share"
curl -sL "https://golang.org/dl/go1.17.linux-amd64.tar.gz" | tar xzf - --strip-components=1 -C "${WILDENV_ROOT_DIR}/share"
