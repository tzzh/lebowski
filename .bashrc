#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL="st"
export EDITOR="vim"

alias ls='ls --color=auto'

# Git completion and prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
	source /usr/share/git/completion/git-prompt.sh 
fi
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
fi

PS1='[\u@\h \W\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]]\$ '
