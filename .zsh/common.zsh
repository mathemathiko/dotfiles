#### commands
alias ls='gls --color=auto'
alias ll='ls -la'
alias rm='rm -i'

## if cd, then ls
function chpwd() { ls -F }


#### colors
# http://qiita.com/Humangas/items/848f0318dfc3c6f5b8e2
export TERM="xterm-256color"
eval $(gdircolors ~/dircolors-solarized/dircolors.256dark)
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi


#### tmux
alias mu='tmux -2'
alias td='tmux detach'
alias ta='tmux attach'

# use tmux at start
# http://d.hatena.ne.jp/tyru/20100828/run_tmux_or_screen_at_shell_startup
is_tmux_running() {
    [ ! -z "$TMUX" ]
}

shell_has_started_interactively() {
    [ ! -z "$PS1" ]
}

resolve_alias() {
    cmd="$1"
    while \
        whence "$cmd" >/dev/null 2>/dev/null \
        && [ "$(whence "$cmd")" != "$cmd" ]
    do
        cmd=$(whence "$cmd")
    done
    echo "$cmd"
}


if ! is_tmux_running && shell_has_started_interactively; then
    for cmd in tmux; do
        if whence $cmd >/dev/null 2>/dev/null; then
            $(resolve_alias "$cmd")
            break
        fi
    done
fi
