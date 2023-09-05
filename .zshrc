# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# 個人設定

# PROMPT="[\[\e[0;36m\]\u@\h\[\e[0m\]] \[\e[0;35m\]\w\[\e[0m\] \$ "
# PROMPT="%F{cyan}%n@%m%f:%~# "

PATH="$PATH:~/bin"

# ls 色設定
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

# grep
alias grep="grep --color=auto"

# vless
alias vless="/usr/share/vim/vim90/macros/less.sh"

# alias
alias ll="ls -al"

# git
alias gst="git status"
alias gb="git branch"
alias gdiff="git diff"

# alias vim="/usr/local/bin/vim"

# ログインし直し. 設定反映などのため
alias relogin='exec $SHELL -l'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# asdfを使用するため 2023/08
. /opt/homebrew/opt/asdf/libexec/asdf.sh


## peco start ----------------

# peco settings
# 過去に実行したコマンドを選択。ctrl-rにバインド
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}


### 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^u' peco-cdr


# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'


# dockerコンテナに入る。deで実行できる
# alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

## pec end -----------------------

