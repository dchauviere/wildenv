#!/bin/bash
curl -sL 'https://github.com/junegunn/fzf/releases/download/0.27.2/fzf-0.27.2-linux_amd64.tar.gz' | tar xzf - -C "$HOME/.local/bin"
curl -sL -o "$HOME/.local/bin/fzf-tmux" "https://github.com/junegunn/fzf/raw/master/bin/fzf-tmux"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/fzf"
curl -sL -o "${XDG_DATA_HOME:-$HOME/.local/share}/fzf/completion.bash" "https://github.com/junegunn/fzf/raw/master/shell/completion.bash"
curl -sL -o "${XDG_DATA_HOME:-$HOME/.local/share}/fzf/key-bindings.bash" "https://github.com/junegunn/fzf/raw/master/shell/key-bindings.bash"
chmod a+x "$HOME/.local/bin/fzf"*
