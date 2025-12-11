# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_all_dups
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thomas/.zshrc'

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall
#

source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias nv=nvim
alias lv="NVIM_APPNAME=nvim-lazyvim nvim"
alias ls="lsd -l"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

 setopt share_history

 export NVM_DIR="$HOME/.nvm"

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color always'
export EDITOR="nvim"

function cpr {
    if DIR=$(find ~/Projects -maxdepth 1 -mindepth 1 -exec basename {} \;| fzf --height 40% --reverse --border) ;
    then
        cd "$HOME/Projects/$DIR" || exit 1
    fi
}

alias git-last-branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)' --count=5"

function gb {
  local tags branches target
  branches=$(
    git for-each-ref --sort=-committerdate refs/heads/ refs/remotes/ \
      --format="%(if)%(HEAD)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(committerdate:short) %(refname:short)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --height 40% --reverse --border --no-hscroll --no-multi -n 3 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{3}'") || return
  git checkout $(awk '{print $3}' <<<"$target" )
}

function dkill {
    docker kill $(docker ps -q)
}

bindkey -s '^p' 'cpr\n'
bindkey -s '^g' 'gb\n'
bindkey -s '^z' 'source ~/.zshrc\n'
bindkey -s '^n' 'nvim\n'
eval "$(pyenv init -)"


source ~/.secrets

eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="$PATH:/Users/thomas/.local/bin"
eval "$(mise activate zsh)"
