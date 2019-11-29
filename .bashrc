# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

export HISTSIZE=10000
export EDITOR=nvim

alias ls='ls -G'
alias nv='nvim'

# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

function aws_profile() {
    case "$AWS_PROFILE" in
        "") echo ""
            ;;
        *) echo "<$AWS_PROFILE>"
            ;;
    esac
}

PS1='[\u@\h \w\[\033[33m\]$(__git_ps1)\[\033[00m\] \[$(tput setaf 2)\]$(aws_profile)\[$(tput sgr0)\]]\$ '

source ~/.aws/set_aws_env_trainlinerc
#set-aws-env staging > /dev/null

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.local/share/nvim/plugged/vim-iced/bin/:$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export BASTION_USERNAME=tormezzano
export CORP_USER=tormezzano
export BASTION_KEY_PATH=~/.ssh/ttl-bastion-decrypted
export BASTION_KEY=~/.ssh/ttl-bastion
export FZF_DEFAULT_COMMAND='fd --type f'
