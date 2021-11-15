#!/bin/bash

source <(kubectl completion bash)
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubectx"
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubens"
alias k=kubectl
complete -F __start_kubectl k

function _kubectl_helper() {
  local _cmd=$@
  local _object=$(kubectl get all --no-headers -o name | fzf --info=inline --layout=reverse --border --prompt "$(kubectl config current-context | sed 's/-context$//')> " --preview-window "right,follow" --preview "kubectl describe {}")
  [[ "$_object" = "" ]]&& return
  kubectl $_cmd "${_object%% *}"
}

alias kl="_kubectl_helper logs"
alias kd="_kubectl_helper describe"
alias kx="kubectl get pods --no-headers | fzf | awk '{print $1}' | xargs -o -I % kubectl exec -it % bash"

_fzf_setup_completion path kubectl k

eval "$(k3d completion bash)"
