#!/bin/bash

source <(kubectl completion bash)
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubectx"
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubens"
alias k=kubectl
complete -F __start_kubectl k

alias kl="kubectl get all --no-headers | fzf | awk '{print \$1}' | xargs -o kubectl logs"
#alias kd="kubectl get all --no-headers | fzf --preview \"echo {} |cut -d' ' -f1 | xargs kubectl describe\" | awk '{print \$1}' | xargs -o kubectl describe"

function _fzf_kubectl_helper() {
  local _cmd=$@
  local _object=$(kubectl get all -o name | fzf --preview "kubectl describe {}")
  [[ "$_object" = "" ]]&& return
  kubectl $_cmd "${_object%% *}"
}

alias kl="_fzf_kubectl_helper logs"
alias kd="_fzf_kubectl_helper describe"
