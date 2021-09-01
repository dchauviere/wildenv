GO_VERSION=1.17
mkdir -p "$HOME/.local/share/go/${GO_VERSION}"
curl -sL "https://golang.org/dl/go1.17.linux-amd64.tar.gz" | tar xzf - --strip-components=1 -C "$HOME/.local/share/go/${GO_VERSION}"
ln -snf "$HOME/.local/share/go/${GO_VERSION}" "$HOME/.local/share/go/default"
