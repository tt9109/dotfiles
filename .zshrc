
#文字コード
export LANG=ja_JP.UTF-8

#using coreutils
alias ls="gls --color=auto -a"
alias vi='vim'
#rmするとゴミ箱に行く
alias rm='rmtrash'
alias up='cd ..'

#homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#移動したディレクトリをストックする
setopt autopushd
setopt pushd_ignore_dups

#自動でls
function chpwd() { ls }

#基本の補完
autoload -U compinit && compinit

#選択した候補をハイライト
zstyle ':completion:*:default' menu select=2

#予測変換
autoload predict-on

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_all_dups

# 開始と終了を記録
setopt extended_history

#前回の履歴と結合する
setopt append_history

#色
autoload colors && colors

#大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#ディレクトリ表示
PROMPT="
%{${fg[yellow]}%}%~%{${reset_color}%}
[%n]$ "
PROMPT2='[%n]> '

function agvim () {
if [ -z "$@" ]
then
  echo -e "\033[0;31mError:no arguments selected\033[0;39m" && return
else
  args=$(ag "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
  if [ -z $args  ]
  then
    return
  else
    vim $(echo $args)
  fi
fi
}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


function peco-select-history() {
local tac
if which tac > /dev/null; then
  tac="tac"
else
  tac="tail -r"
fi
BUFFER=$(\history -n 1 | \
  eval $tac | \
  peco --query "$LBUFFER")
CURSOR=$#BUFFER
zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
