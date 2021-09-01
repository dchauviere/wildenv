#!/bin/bash

function pip_install() {
  local _pkgs=( "$@" )
  . "${WILDENV_ROOT_DIR}/python/bin/activate"
  pip install "${_pkgs[@]}"
  deactivate
}

# Direnv
mkdir -p "${WILDENV_ROOT_DIR}/"{etc/direnv,share/direnv/{cache,data}}
curl -sL -o "${WILDENV_ROOT_DIR}/bin/direnv" "https://github.com/direnv/direnv/releases/download/v2.28.0/direnv.linux-amd64"
chmod a+x "${WILDENV_ROOT_DIR}/bin/direnv"
cp "$(dirname ${BASH_SOURCE[0]})/files/direnv.toml" "${WILDENV_ROOT_DIR}/etc/direnv/direnv.toml"

# Fzf
curl -sL 'https://github.com/junegunn/fzf/releases/download/0.27.2/fzf-0.27.2-linux_amd64.tar.gz' | tar xzf - -C "${WILDENV_ROOT_DIR}/bin"
curl -sL -o "${WILDENV_ROOT_DIR}/bin/fzf-tmux" "https://github.com/junegunn/fzf/raw/master/bin/fzf-tmux"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/completion/fzf.bash" "https://github.com/junegunn/fzf/raw/master/shell/completion.bash"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/key-bindings/fzf.bash" "https://github.com/junegunn/fzf/raw/master/shell/key-bindings.bash"
chmod a+x "${WILDENV_ROOT_DIR}/bin/fzf"*

# Ripgrep
mkdir -p "${WILDENV_ROOT_DIR}/share/ripgrep"
curl -sL "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz" |tar xzf - --strip-components=1 -C "${WILDENV_ROOT_DIR}/share/ripgrep"
ln -s "${WILDENV_ROOT_DIR}/share/ripgrep/rg" "${WILDENV_ROOT_DIR}/bin/rg"

# Json & Yaml
curl -sL -o "${WILDENV_ROOT_DIR}/bin/jq" "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"
chmod a+x "${WILDENV_ROOT_DIR}/bin/jq"
pip_install yq
ln -s "${WILDENV_ROOT_DIR}/python/bin/yq" "${WILDENV_ROOT_DIR}/bin/yq"

# Powerline-go
curl -sL -o "${WILDENV_ROOT_DIR}/bin/powerline-go" "https://github.com/justjanne/powerline-go/releases/download/v1.21.0/powerline-go-linux-amd64"
chmod a+x "${WILDENV_ROOT_DIR}/bin/powerline-go"
cp "$(dirname ${BASH_SOURCE[0]})/files/powerline-go.theme.json" "${WILDENV_ROOT_DIR}/etc/powerline-go.theme.json"
