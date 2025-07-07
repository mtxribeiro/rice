[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias rm='rm -r'
alias rmf='rm -rf'

alias cl='clear'

alias sp='sudo pacman'

alias vim='nvim'
alias code='tmux new-session "nvim"'

PS1=' \w '
