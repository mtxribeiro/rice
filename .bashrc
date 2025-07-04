#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias rm='rm -r'
alias rmf='rm -rf'

alias tmuxvim='tmux new-session "nvim"'
alias vim='nvim'

alias cl='clear'
alias xx='exit'

PS1=' \w '
