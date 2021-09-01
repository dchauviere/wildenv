#!/bin/bash

function _shelltools_update_ps1() {
  PS1="$("${WILDENV_ROOT_DIR}/bin/powerline-go" \
    -error $? \
    -modules "${WILDENV_SHELLTOOLS_POWERLINE_GO_MODULES:-exit,ssh,perms,cwd,git,docker-context,kube}" \
    -newline \
    -path-aliases \~/src/paas/paas-manifests=@PAAS \
    -shell bash \
    -cwd-mode fancy \
    -truncate-segment-width 16 \
    -theme "${WILDENV_SHELLTOOLS_POWERLINE_GO_THEME:-${WILDENV_ROOT_DIR}/etc/powerline-go.theme.json}" \
  )"
}

if [ "$TERM" != "linux" ] && [ "$TERM" != "tramp" ] && [ -f "${WILDENV_ROOT_DIR}/bin/powerline-go" ]; then
  PROMPT_COMMAND="_shelltools_update_ps1"
fi

export DIRENV_CONFIG="${WILDENV_ROOT_DIR}/etc/direnv"

eval "$(direnv hook bash)"

. "${WILDENV_ROOT_DIR}/etc/bash/completion/fzf.bash"
. "${WILDENV_ROOT_DIR}/etc/bash/key-bindings/fzf.bash"
