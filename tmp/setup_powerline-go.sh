#!/bin/bash
mkdir -p "$HOME/.local/bin"
curl -sL -o "$HOME/.local/bin/powerline-go" "https://github.com/justjanne/powerline-go/releases/download/v1.21.0/powerline-go-linux-amd64"
chmod a+x "$HOME/.local/bin/powerline-go"
cp "$(dirname "$0")/.powerline-go.theme.json" "$HOME/."
