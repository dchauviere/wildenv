#!/bin/bash
function _update_ps1() {
    PS1="$("$HOME/.local/bin/powerline-go" \
        -error $? \
        -modules exit,ssh,perms,cwd,git,docker-context,kube \
        -newline \
        -path-aliases \~/src/paas/paas-manifests=@PAAS \
        -shell bash \
        -cwd-mode fancy \
        -truncate-segment-width 16 \
        -theme "$HOME/.powerline-go.theme.json" \
    )"
}

if [ "$TERM" != "linux" ] && [ "$TERM" != "tramp" ] && [ -f "$HOME/.local/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1"
fi