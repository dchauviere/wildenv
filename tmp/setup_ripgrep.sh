#!/bin/bash
mkdir -p "$HOME/.local/share/ripgrep"
curl -sL "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz" |tar xzf - --strip-components=1 -C "$HOME/.local/share/ripgrep"
ln -s "$HOME/.local/share/ripgrep/rg" "$HOME/.local/bin/rg"

# TODO: setup completion !!
