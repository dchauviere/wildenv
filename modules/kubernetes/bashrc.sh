#!/bin/bash

source <(kubectl completion bash)
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubectx"
source "${WILDENV_ROOT_DIR}/etc/bash/completion/kubens"

function _khelper() {
  local _cmd=$1
  shift
  local _args=("$@")

  case "$_cmd" in
  describe)
    kubectl get all,networkpolicies,sa,roles,rolebindings,configmaps,secrets "${_args[@]}" --no-headers -o name | \
      fzf --info=inline \
          --layout=reverse \
          --border \
          --prompt "Describe> " \
          --preview-window "right" \
          --preview "kubectl describe {} ${_args[*]}| bat -l yaml --color always --style=plain"
    ;;
  logs)
    _object=$(kubectl get pods,daemonsets,deployments,replicasets "${_args[@]}" --no-headers -o name | \
      fzf --info=inline \
          --layout=reverse \
          --border \
          --prompt "Logs> " \
          --preview-window "bottom:75%,follow" \
          --preview "kubectl logs ${_args[*]} -f --tail=200 {}"
    )
    [[ "$_object" = "" ]]&& return
    kubectl logs -f --tail=200 "${_args[@]}" "${_object%% *}"
    ;;
  esac
}

alias k=kubectl
alias kl="_khelper logs"
alias kd="_khelper describe"
alias kx="kubectl exec -ti"
alias kn="kubens"
alias kc="kubectx"
alias kg="kubectl get all,sa,networkpolicies,roles,rolebindings,configmaps,secrets"

complete -F __start_kubectl kx
complete -F __start_kubectl k
complete -F __start_kubectl kg

eval "$(k3d completion bash)"
