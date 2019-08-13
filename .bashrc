#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERMINAL="st"
export EDITOR="nvim"

alias ls="ls -hN --color=auto --group-directories-first" 
alias grep="grep --color=auto"
alias nv='nvim'

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# Git completion and prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
	source /usr/share/git/completion/git-prompt.sh 
fi
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
fi

PS1='[\u@\h \w\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]]\$ '

# nodejs global packages
PATH="$PATH:$HOME/.node_modules/bin"
export npm_config_prefix=~/.node_modules


PATH="$PATH:$HOME/.local/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
