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

alias cl='clear'

alias dev='tmux new-session "nvim"'
alias vim='nvim'

PS1=' \w '
