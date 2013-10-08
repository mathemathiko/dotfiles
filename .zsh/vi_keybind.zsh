bindkey -v

## use commandline-stack with vi keybind
bindkey 'eq' push-line
 
## use hjkl when complist select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

## history-search-end with vi keybind
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## display mode with vi keybind
readuntil () {
  typeset a
  while [ "$a" != "$1" ]
  do
  read -E -k 1 a
  done
}
