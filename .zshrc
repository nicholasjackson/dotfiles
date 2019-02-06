# Path to your oh-my-zsh installation.
export ZSH=/home/jacksonnic/.oh-my-zsh

ZSH_THEME="bullet-train"
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_PROMPT_ORDER=(
  git
  context
  dir
  time
)

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

function ssh_pinentry() {
  gpg-connect-agent updatestartuptty /bye > /dev/null;
  ssh $@;
}

function git_pinentry() {
  gpg-connect-agent updatestartuptty /bye > /dev/null;
  git $@;
}

plugins=(git)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="jacksonnic@penguin"
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export GOPATH=~/Developer/go
export GOBIN=~/Developer/go/bin

export PATH="/usr/local/bin:/bin:/usr/local/go/bin:$PATH"
export PATH="$PATH:$GOPATH/bin:/usr/local/share/dotnet"
export PATH="$HOME/.tmux:$PATH" # Add Tmux
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH="/usr/local/apache-maven-3.3.9/bin:$PATH" # Add MAVEN to PATH for scripting
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
export PATH=$PATH:/Users/nicj/.cargo/bin

export EDITOR="nvim"
export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
export AWS_DEFAULT_PROFILE=default

alias vim='nvim'
alias ctags="/usr/local/bin/ctags"
alias restart_gpg='killall gpg-agent && gpg-agent --daemon'
alias start_gpg='gpg-agent --daemon'
alias ssh='ssh_pinentry'
alias git='git_pinentry'
alias switch_key='gpg2 --delete-secret-key F441E5E4 && gpg2 --card-status'
alias faas='faas-cli'
alias mux='tmuxinator'

# Azure CLI
export PATH=$PATH:/Users/nicj/bin

GPG_TTY=$(tty)
export GPG_TTY
export SSH_AUTH_SOCK=/run/user/$UID/gnupg/S.gpg-agent.ssh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

# added by travis gem
[ -f /Users/nicj/.travis/travis.sh ] && source /Users/nicj/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nicj/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/nicj/google-cloud-sdk/path.zsh.inc'; fi

setopt noflowcontrol
setopt noincappendhistory
setopt nosharehistory
setopt histexpiredupsfirst # Expire duplicate entries first when trimming history.
setopt histignoredups      # Don't record an entry that was just recorded again.
setopt histignorealldups   # Delete old recorded entry if new entry is a duplicate.
setopt histfindnodups      # Do not display a line previously found.
setopt histignorespace     # Don't record an entry starting with a space.
setopt histsavenodups      # Don't write duplicate entries in the history file.
setopt ignoreeof           # Don't exit shell on ctrl D

# NOMAD AUTH
export NOMAD_TOKEN=ce7f0c75-c452-674b-be37-9802bd13ee7c

zle -N pet-select
stty -ixon
bindkey '^s' pet-select

autoload -U +X bashcompinit && bashcompinit
complete -C /usr/local/bin/nomad nomad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
