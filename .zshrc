#なるべくbashの設定を使う
source ~/.bash_profile

#補完機能を使用する
autoload -U compinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#zsh内蔵エディタを使う
autoload -U zcalc
autoload zed

#zm内蔵リネームを使う
autoload -U zmv
alias mmv='noglob zmv -W'
#openssl ecparam -name secp384r1 -genkey > server.key
#openssl req -new -key server.key -out server.csr
#openssl req -in server.csr -key server.key -x509 -out server.crt -days $(( 365 * 5 ))
#zmv -W -n 'server.*' 'server.lcoal.*'

#予測入力させる
autoload predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^P' predict-on
bindkey '^O' predict-off
zstyle ':predict' verbose true

#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#インクリメンタルサーチの設定
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

#履歴のインクリメンタル検索でワイルドカード利用可能
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

#プロンプト関係
#PROMPT="[%n@%m %~]%(!.#.$) "
#PROMPT2="%n %_%%"
#SPROMPT="%r is correct? [n,y,a,e]: "
#RPROMPT="[%l/zsh]"

autoload -Uz promptinit
promptinit
prompt redhat
#prompt -l
#prompt -l
#prompt -p

#エディタでライン編集
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#ヒストリーサイズ設定
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
PATH=${PATH}:~/bin

#ヒストリの一覧を読みやすい形に変更
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

#補完リストが多いときに尋ねない
LISTMAX=1000

#"|,:"を単語の一部とみなさない
WORDCHARS="$WORDCHARS|:"

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

#http://www.ayu.ics.keio.ac.jp/~mukai/translate/zshoptions.html
#タブキーの連打で自動的にメニュー補完
setopt AUTO_MENU
#/foo/barでいきなりcd
setopt AUTO_CD
#"~$var" でディレクトリにアクセス
setopt AUTO_NAME_DIRS
#補完が/で終って、つぎが、語分割子か/かコマンドの後(;とか&)だったら、補完末尾の/を取る
unsetopt AUTO_REMOVE_SLASH
#曖昧な補完で、自動的に選択肢をリストアップ
setopt AUTO_LIST
#変数名を補完する
setopt AUTO_PARAM_KEYS
#プロンプト文字列で各種展開を行なう
setopt PROMPT_SUBST
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt AUTO_RESUME
#rm * などの際確認しない
setopt rm_star_silent
#ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt MARK_DIRS
#明確なドットの指定なしで.から始まるファイルをマッチ
#rm *で確認
unsetopt RM_STAR_WAIT
#行の末尾がバッククォートでも無視する
setopt SUN_KEYBOARD_HACK
#~hoge以外にマッチする機能を使わない
setopt EXTENDED_GLOB
#補完対象のファイルの末尾に識別マークをつける
setopt LIST_TYPES
#BEEPを鳴らさない
setopt NO_BEEP
#補完候補など表示する時はその場に表示し、終了時に画面から消す
setopt ALWAYS_LAST_PROMPT
#cd kotaで/home/kotaに移動する
setopt CDABLE_VARS
#クォートされていない変数拡張が行われたあとで、フィールド分割
setopt SH_WORD_SPLIT
#定義された全ての変数は自動的にexportする
setopt ALL_EXPORT
#ディレクトリ名を補完すると、末尾がスラッシュになる。
setopt AUTO_PARAM_SLASH
#普通のcdでもスタックに入れる
setopt AUTO_PUSHD
#コマンドのスペルの訂正を使用する
setopt CORRECT
#コマンドのスペルの訂正を使用する
unsetopt CORRECT_ALL
#aliasを展開して補完
unsetopt complete_aliases
#"*" にドットファイルをマッチ
unsetopt GLOB_DOTS
#補完候補を詰めて表示
setopt LIST_PACKED
#ディレクトリスタックに、同じディレクトリを入れない
setopt PUSHD_IGNORE_DUPS
#^Dでログアウトしないようにする
unsetopt IGNORE_EOF
#ジョブの状態をただちに知らせる
setopt NOTIFY
#複数のリダイレクトやパイプに対応
setopt MULTIOS
#ファイル名を数値的にソート
setopt NUMERIC_GLOB_SORT
#リダイレクトで上書き禁止
unsetopt NOCLOBBER
#=以降でも補完できるようにする
setopt MAGIC_EQUAL_SUBST
#補完候補リストの日本語を正しく表示
setopt PRINT_EIGHT_BIT
#右プロンプトに入力がきたら消す
setopt TRANSIENT_RPROMPT
#戻り値が0以外の場合終了コードを表示
unsetopt PRINT_EXIT_VALUE
#echo {a-z}などを使えるようにする
setopt BRACE_CCL
#!!などを実行する前に確認する
setopt HISTVERIFY
#余分な空白は詰めて記録
setopt HIST_IGNORE_SPACE
#ヒストリファイルを上書きするのではなく、追加するようにする
setopt APPEND_HISTORY
#ジョブがあっても黙って終了する
setopt NO_CHECK_JOBS
#ヒストリに時刻情報もつける
setopt EXTENDED_HISTORY
#履歴がいっぱいの時は最も古いものを先ず削除
setopt HIST_EXPIRE_DUPS_FIRST
#履歴検索中、重複を飛ばす
setopt HIST_FIND_NO_DUPS
#ヒストリリストから関数定義を除く
setopt HIST_NO_FUNCTIONS
#前のコマンドと同じならヒストリに入れない
setopt HIST_IGNORE_DUPS
#重複するヒストリを持たない
setopt HIST_IGNORE_ALL_DUPS
#実行するまえに必ず展開結果を確認できるようにする
setopt HIST_VERIFY
#履歴をインクリメンタルに追加
setopt INC_APPEND_HISTORY
#history コマンドをヒストリに入れない
setopt HIST_NO_STORE
#履歴から冗長な空白を除く
setopt HIST_REDUCE_BLANKS
#履歴を共有
setopt SHARE_HISTORY
# 古いコマンドと同じものは無視
setopt HIST_SAVE_NO_DUPS
#補完時にヒストリを自動的に展開する
setopt HIST_EXPAND
#改行コードで終らない出力もちゃんと出力する
setopt NO_PROMPTCR
#loop の短縮形を許す
setopt SHORT_LOOPS
#コマンドラインがどのように展開され実行されたかを表示する
unsetopt XTRACE
#ディレクトリの最後のスラッシュを自動で削除
unsetopt AUTOREMOVESLASH
#シンボリックリンクは実体を追うようになる
unsetopt CHASE_LINKS
#$0 にスクリプト名/シェル関数名を格納
setopt FUNCTION_ARGZERO
#Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_FLOW_CONTROL
#コマンドラインでも # 以降をコメントと見なす
setopt INTERACTIVE_COMMENTS
#デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
unsetopt SINGLE_LINE_ZLE
#語の途中でもカーソル位置で補完
setopt COMPLETE_IN_WORD
#バックグラウンドジョブが終了したらすぐに知らせる。
setopt NO_TIFY

#C-Uで行頭まで削除
bindkey "^U" backward-kill-line

# C-^ で一つ上のディレクトリへ
function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '^^' cdup

#ttyで省電力のための画面を消す機能を無効化する(xterm)
#setterm -blank 0

#TABで展開を抑止
bindkey "^I" complete-word

#端末設定
#Ctrl+H に 1 文字削除
#stty erase '^H'
#Ctrl+C に割り込み
#stty intr '^C'
# Ctrl+Z にサスペンド
#stty susp '^Z'

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

#zsh Git
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' actionformats '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f%F{1}%u%f%F{6}%c%f'
zstyle ':vcs_info:git:*' formats       '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{5}]%F{1}%u%f%F{6}%c%f'
precmd() { vcs_info }
RPROMPT='${vcs_info_msg_0_}%f'
REPORTTIME=3


# Lines configured by zsh-newuser-install
export EDITORP=vim #エディタをvimに設定
export LANG=ja_JP.UTF-8 #文字コードをUTF-8に設定

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'


# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる



# プロンプト文字列を%F{色指定}と%fで囲めばその中は指定した色になる
# black	0
# red	1
# green	2
# yellow	3
# blue	4
# magenta	5
# cyan	6
# white	7


# ユーザ名@ホスト名
PROMPT='

■  %F{1}%~%f
%F{6}%#%f '
# 現在時刻
RPROMPT=$'`rprompt-git-current-branch`  %T%{\e[m%}'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}



#vi ライクな操作ができる
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

autoload -Uz compinit
compinit

#
# setopt
#


# End of lines added by compinstall
