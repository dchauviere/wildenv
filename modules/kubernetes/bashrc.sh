#!/bin/bash

source <(kubectl completion bash)
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubectx"
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubens"
alias k=kubectl
complete -F __start_kubectl k

function _kubectl_helper() {
  local _cmd=$@
  local _object=$(kubectl get all -o name | fzf --preview "kubectl describe {}")
  [[ "$_object" = "" ]]&& return
  kubectl $_cmd "${_object%% *}"
}

alias kl="_kubectl_helper logs"
alias kd="_kubectl_helper describe"

_fzf_setup_completion path kubectl k
