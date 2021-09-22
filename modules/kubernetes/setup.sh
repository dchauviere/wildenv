#!/bin/bash

curl -sL -o "${WILDENV_ROOT_DIR}/bin/kubectl" "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
curl -sL -o "${WILDENV_ROOT_DIR}/bin/kubectx" "https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx"
curl -sL -o "${WILDENV_ROOT_DIR}/bin/kubens" "https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens"
chmod a+x "${WILDENV_ROOT_DIR}/bin/"{kubectl,kubectx,kubens}

curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/completion/kubectx" "https://github.com/ahmetb/kubectx/raw/master/completion/kubectx.bash"
curl -sL -o "${WILDENV_ROOT_DIR}/etc/bash/completion/kubens" "https://github.com/ahmetb/kubectx/raw/master/completion/kubens.bash"

curl -sL "https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz" |tar xz -C "${WILDENV_ROOT_DIR}/bin/" --strip-components=1 linux-amd64/helm

curl -sL -o "${WILDENV_ROOT_DIR}/bin/k3d" "https://github.com/rancher/k3d/releases/download/v4.4.8/k3d-linux-amd64"
chmod a+x "${WILDENV_ROOT_DIR}/bin/k3d"
