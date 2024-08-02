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

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias nv=nvim
alias ls="lsd -l"
# alias cat=bat

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

 setopt share_history

 export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color always'
export EDITOR="nvim"

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
#eval "$(direnv hook zsh)"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

source <(kubectl completion zsh)

function cpr {
    if DIR=$(find ~/Projects -maxdepth 1 -mindepth 1 -exec basename {} \;| fzf --height 40% --reverse --border) ;
    then
        cd "$HOME/Projects/$DIR" || exit 1
    fi
}

function gb {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --height 40% --reverse --border --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

function dkill {
    docker kill $(docker ps -q)
}

function pipenv-install-from-codeartifact {
    CODEARTIFACT_TOKEN=$(get-codeartifact-token) pipenv install --dev
}

bindkey -s '^p' 'cpr\n'
bindkey -s '^g' 'gb\n'
bindkey -s '^z' 'source ~/.zshrc\n'
bindkey -s '^n' 'nvim\n'
eval "$(pyenv init -)"


source ~/.secrets

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use --silent
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    nvm use --silent default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


# Created by `pipx` on 2022-05-10 09:04:47
export PATH="$PATH:/Users/thomas/.local/bin"
