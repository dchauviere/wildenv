#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/../../lib/wildenv.lib.sh"

# Direnv
mkdir -p "${WILDENV_ROOT_DIR}/"{etc/direnv,share/direnv/{cache,data}}
curl -sL -o "${WILDENV_ROOT_DIR}/bin/direnv" "https://github.com/direnv/direnv/releases/download/v2.28.0/direnv.linux-amd64"
chmod a+x "${WILDENV_ROOT_DIR}/bin/direnv"
cp "$(dirname ${BASH_SOURCE[0]})/files/direnv.toml" "${WILDENV_ROOT_DIR}/etc/direnv/direnv.toml"

# bat
sudo apt-get install -y bat
ln -s /usr/bin/batcat "${WILDENV_ROOT_DIR}/bin/bat"

# Fzf
curl -sL 'https://github.com/junegunn/fzf/releases/download/0.27.2/fzf-0.27.2-linux_amd64.tar.gz' | tar xzf - -C "${WILDENV_ROOT_DIR}/bin"
curl -sL -o "${WILDENV_ROOT_DIR}/bin/fzf-tmux" "https://github.com/junegunn/fzf/raw/master/bin/fzf-tmux"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/completion/fzf" "https://github.com/junegunn/fzf/raw/master/shell/completion.bash"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/key-bindings/fzf" "https://github.com/junegunn/fzf/raw/master/shell/key-bindings.bash"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/completion/fzf-bash-completion.sh" "https://github.com/lincheney/fzf-tab-completion/raw/master/bash/fzf-bash-completion.sh"
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

# Zellij
curl -sL 'https://github.com/zellij-org/zellij/releases/download/v0.16.0/zellij-x86_64-unknown-linux-musl.tar.gz' |tar xzf - -C "${WILDENV_ROOT_DIR}/bin/"
chmod a+x "${WILDENV_ROOT_DIR}/bin/zellij"

# Shellcheck
curl -sL "https://github.com/koalaman/shellcheck/releases/download/v0.7.2/shellcheck-v0.7.2.linux.x86_64.tar.xz" |tar xJ --strip-components=1 -C "${WILDENV_ROOT_DIR}/bin" --wildcards */shellcheck

# Restic
curl -sL "https://github.com/restic/restic/releases/download/v0.12.1/restic_0.12.1_linux_amd64.bz2" | bzip2 -d -c > "${WILDENV_ROOT_DIR}/bin/restic"
chmod a+x "${WILDENV_ROOT_DIR}/bin/restic"