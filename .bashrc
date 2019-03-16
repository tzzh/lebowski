#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL="alacritty"
export EDITOR="nvim"

alias ls='ls --color=auto'
alias nv='nvim'

# Git completion and prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
	source /usr/share/git/completion/git-prompt.sh 
fi
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
fi

PS1='[\u@\h \W\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]]\$ '

# nodejs global packages
PATH="$PATH:$HOME/.node_modules/bin"
export npm_config_prefix=~/.node_modules


PATH="$PATH:$HOME/.local/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
