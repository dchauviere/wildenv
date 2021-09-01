#!/bin/bash

curl -sL -o "$HOME/.local/bin/jq" "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"
chmod a+x "$HOME/.local/bin/jq"

pip3 install --user yq