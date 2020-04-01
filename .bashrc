# System-wide .bashrc file for interactive bash(1) shells.
#if [ -z "$PS1" ]; then
#   return
#fi

export HISTSIZE=10000
export EDITOR=nvim

alias ls='ls -G'
alias nv='nvim'

# Make bash check its window size after a process completes
#shopt -s checkwinsize

#[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

GREEN="\[\033[0;32m\]"
YELLOW="\[\033[33m\]"
RESTORE="\[\033[0m\]"

source ~/Projects/turing-scripts/set-aws-env.sh

getbranch(){
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -z "$BRANCH" ]
    then
        return
    else
        echo " (${BRANCH})"
    fi
}

getawsprofile() {
    if [ -z "$AWS_PROFILE" ]
    then
        return
    else
        echo " <${AWS_PROFILE}>"
    fi
}

getprompt(){
    echo "[\u@\h \w${YELLOW}$(getbranch)${GREEN}$(getawsprofile)${RESTORE}] $ "
}

promptcmd(){
    set-aws-env
    PS1=$(getprompt)
}
export PROMPT_COMMAND=promptcmd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="/usr/local/sbin:/usr/local/texlive/2019/bin/x86_64-darwin/:$HOME/go/bin/:$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

export BASTION_USERNAME=tormezzano
export CORP_USER=tormezzano
export BASTION_KEY_PATH=~/.ssh/ttl-bastion-decrypted
export BASTION_KEY=~/.ssh/ttl-bastion
export FZF_DEFAULT_COMMAND='fd --type f'
