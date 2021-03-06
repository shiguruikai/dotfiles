export LANG=ja_JP.UTF-8

# set $LS_COLORS
eval "$(dircolors $HOME/.dircolors)"

################################################################################
#      _       _ _
#  ___(_)_ __ (_) |_
# |_  / | '_ \| | __|
#  / /| | | | | | |_
# /___|_|_| |_|_|\__|
#
# https://github.com/zdharma/zinit

if [[ ! -d "$HOME/.zinit" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# trans 翻訳コマンド
zinit ice wait lucid; zinit light soimort/translate-shell

# extract 様々な形式のアーカイブファイルを解凍できる関数
zinit ice wait lucid; zinit snippet OMZ::plugins/extract/extract.plugin.zsh

# Escを2回押すと、現在または以前のコマンドの先頭にsudoを付ける
zinit ice wait lucid; zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Angular CLI
zinit ice wait lucid; zinit snippet OMZ::plugins/ng/ng.plugin.zsh

# docker-compose
zinit ice wait lucid from"gh-r" as"program" mv"docker* -> docker-compose"
zinit light docker/compose
alias dco='docker-compose'
zinit ice wait lucid; zinit snippet OMZ::plugins/docker-compose/_docker-compose

################################################################################
#  ____  ____   _    ____ _____ ____  _   _ ___ ____
# / ___||  _ \ / \  / ___| ____/ ___|| | | |_ _|  _ \
# \___ \| |_) / _ \| |   |  _| \___ \| |_| || || |_) |
#  ___) |  __/ ___ \ |___| |___ ___) |  _  || ||  __/
# |____/|_| /_/   \_\____|_____|____/|_| |_|___|_|
#
zinit light denysdovhan/spaceship-prompt

# プロンプトにカレントディレクトリの全てのフォルダを表示する
SPACESHIP_DIR_TRUNC=0

# プロンプトセクションの順序を指定 https://denysdovhan.com/spaceship-prompt/docs/Options.html#order
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

################################################################################
#          _                   _   _
#  _______| |__     ___  _ __ | |_(_) ___  _ __  ___
# |_  / __| '_ \   / _ \| '_ \| __| |/ _ \| '_ \/ __|
#  / /\__ \ | | | | (_) | |_) | |_| | (_) | | | \__ \
# /___|___/_| |_|  \___/| .__/ \__|_|\___/|_| |_|___/
#                       |_|

# フォーマットの記法
# %F{color}..%f : 色
# %B..%b        : 太字
# %U..%u        : 下線
# %d            : 説明

# 単語の一部と見なす文字（区切り文字と見なさない文字）
# デフォルト *?_-.[]~=/&;!#$%^(){}<>
WORDCHARS="*?_-.[]~&!#$%^(){}<>"

# Changing Directories
setopt AUTO_CD                 # ディレクトリ名だけでcdコマンドを実行する
setopt AUTO_PUSHD              # cd -[TAB] で以前移動したディレクトリの候補を表示する
setopt PUSHD_IGNORE_DUPS       # AUTO_PUSHD で重複したディレクトリを記録しない
setopt CHASE_LINKS             # ディレクトリを変更したとき、シンボリックリンクを実体パスに変換する

# Input/Output
setopt CORRECT                 # コマンドのスペルミスを指摘し修正するか尋ねる
setopt INTERACTIVE_COMMENTS    # 対話型シェルで'#'コメントを使えるようにする

# Expansion and Globbing
setopt BRACE_CCL               # ブレース展開機能
setopt NUMERIC_GLOB_SORT       # ファイル名を辞書順ではなく数字順にソート
setopt MAGIC_EQUAL_SUBST       # 引数の'='以降でも補完する

# Prompting
setopt PROMPT_SUBST            # プロンプトでパラメータ展開、コマンド置換、算術展開をする
setopt TRANSIENT_RPROMPT       # コマンド実行後に右プロンプトを削除する

# Completion
setopt ALWAYS_LAST_PROMPT      # 補完候補を表示した後でもプロンプトの位置を変えない
setopt AUTO_LIST               # 補完候補のリストを表示する
setopt AUTO_MENU               # TAB連打で候補を選択する
setopt AUTO_PARAM_SLASH        # 補完したディレクトリの末尾にスラッシュを追加する
setopt COMPLETE_IN_WORD        # カーソル位置で補完する
setopt LIST_PACKED             # 補完候補を詰めて表示する
setopt LIST_TYPES              # 補完候補でファイルの種類を表示する

zstyle ':completion:*' verbose true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' list-separator '-->'

# 補完候補
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' completer _complete

# マッチするものがなければ、大文字小文字を無視して再マッチング
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# 大文字小文字を無視してマッチング
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# 補完候補リストのグループ化とそのグループの説明を表示する
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group true
zstyle ':completion:*:options' description true
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*'              format '%F{yellow}-- %d --%f'
zstyle ':completion:*:corrections'  format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages'     format '%F{purple} -- %d --%f'
zstyle ':completion:*:warnings'     format '%F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# sudoコマンドの後で補完するためのパス
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# History
HISTFILE=~/.zsh_history         # 履歴ファイルの保存先
HISTSIZE=100000                 # メモリに保存される履歴の件数
SAVEHIST=$HISTSIZE                 # 履歴ファイルに保存される履歴の件数
setopt APPEND_HISTORY           # ヒストリーファイルを上書きせず追加する
setopt HIST_FIND_NO_DUPS        # 履歴エントリ検索中一度見つけたコマンドを表示しない
setopt HIST_IGNORE_ALL_DUPS     # 重複するコマンドの古い方を削除する
setopt HIST_IGNORE_DUPS         # 直前と重複するコマンドを記録しない
setopt HIST_IGNORE_SPACE        # 先頭がスペースのコマンドを記録しない
setopt HIST_NO_FUNCTIONS        # 関数定義を記録しない
setopt HIST_NO_STORE            # history (fc -l) コマンドは記録しない
setopt HIST_REDUCE_BLANKS       # 余分な空白を削除
# setopt EXTENDED_HISTORY       # タイムスタンプ機能 ': <開始時間>:<経過秒数>;<コマンド>' の形式で記録される
# 下記3つの設定は排他的に機能する
# setopt INC_APPEND_HISTORY         # シェルの終了を待たず, コマンド実行時に記録する
# setopt INC_APPEND_HISTORY_TIME  # シェルの終了を待たず, コマンド終了時に EXTENDED_HISTORY 形式で記録する
setopt SHARE_HISTORY            # 履歴を複数端末間で共有, EXTENDED_HISTORY 形式で記録する

# キーバインドの設定
bindkey ';5D'     backward-word              # 単語区切りで後方移動
bindkey ';5C'     forward-word               # 単語区切りで前方移動
bindkey '^[[Z'    reverse-menu-complete      # Shift+Tabで補完候補を逆順する

# カーソル位置までの入力から履歴を検索し、カーソル位置を行末に移動する
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end

################################################################################
#        _ _
#   __ _| (_) __ _ ___
#  / _` | | |/ _` / __|
# | (_| | | | (_| \__ \
#  \__,_|_|_|\__,_|___/

alias rm='rm -i'
alias diff='diff -u'
alias gdiff='git diff --color-words'
alias grep='grep --color=auto'

# apt
alias apti='sudo apt install'
alias aptud='sudo apt update'
alias aptug='sudo apt upgrade'
alias aptudgy='sudo apt update && sudo apt upgrade -y'

# cd
alias ..='cd ..'
alias ....='cd ../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# ls
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -A'
alias la1='ls -A1'
alias ll='ls -hl'
alias lla='ls -Ahl'

# xdg-open
alias open='xdg-open'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='open'

# xclip
which xclip > /dev/null \
  && alias pbcopy='xclip -selection clipboard' \
  && alias pbpaste='xclip -selection c -o'

# python
alias python='python3'
alias pip='pip3'
alias pipug='pip list -o | tail -n +3 | cut -d " " -f 1 | xargs pip install -U'

# global alias
# alias -g C='| pbcopy'
# alias -g G='| grep'
# alias -g H='| head'
# alias -g L='| less -R'
# alias -g T='| tail'

# xmllint
alias xpath='xmllint --html --xpath 2>/dev/null'

# thefuck https://github.com/nvbn/thefuck
which thefuck > /dev/null && alias fuck='thefuck'

# SDKMAN https://sdkman.io/install
[[ -r ${SDKMAN_DIR}/bin/sdkman-init.sh ]] && source ${SDKMAN_DIR}/bin/sdkman-init.sh

# rustup https://www.rust-lang.org/tools/install
[[ -r $HOME/.cargo/env ]] && source $HOME/.cargo/env

# Starship https://github.com/starship/starship
# which starship > /dev/null || curl -fsSL https://starship.rs/install.sh | bash
# which starship > /dev/null && eval "$(starship init zsh)"

# Wi-Fiでadb接続をする
function adbw {
  ipAddr=$(adb shell "ip addr show wlan0 | grep 'inet ' | sed -e 's/^.*inet //g' -e 's/\/.*$//g'")
  adb tcpip 5555
  adb connect $ipAddr:5555
}
