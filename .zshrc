# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/thomaso/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
setopt share_history


alias ls='ls -G'
alias nv='nvim'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export FZF_DEFAULT_COMMAND='fd --type f'
export BASTION_USERNAME=tormezzano
export CORP_USER=tormezzano
export BASTION_KEY_PATH=~/.ssh/ttl-bastion-decrypted
export BASTION_KEY=~/.ssh/ttl-bastion
export EDITOR=nvim
source  /usr/local/opt/turing-scripts/set-aws-env.sh
#source ~/Projects/turing-scripts/set-aws-env.sh
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="/usr/local/sbin:$PATH:$GOBIN"
source ~/.secretsrc
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

alias love="/Applications/love.app/Contents/MacOS/love"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
