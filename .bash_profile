# .bashrcを読み込む
if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi


echo -e "\e[34m  .o8                          oooo                                                   .o88o.  o8o  oooo 		   "
echo -e "\e[34m  888                           888                                                   888     ~~~   888 		   "
echo -e "\e[34m  888oooo.   .oooo.    .oooo.o  888 .oo.               oo.ooooo.  oooo d8b  .ooooo.  o888oo  oooo   888   .ooooo.   "
echo -e "\e[37m  d88   88b  P  )88b  d88(   8  888P Y88b               888   88b  888  8P d88   88b  888     888   888  d88   88b  "
echo -e "\e[37m  888   888  .oP 888   *Y88b.   888   888               888   888  888     888   888  888     888   888  888ooo888  "
echo -e "\e[37m  888   888 d8(  888  o.  )88b  888   888               888   888  888     888   888  888     888   888  888    .o  "
echo -e "\e[31m   Y8bod8P   Y888* 8o 8 *888P  o888o o888o ooooooooooo  888bod8P  d888b     Y8bod8P  o888o   o888o o888o  Y8bod8P   "
echo -e "\e[31m                                                        888							   "
echo -e "\e[31m                                                       o888o							   "




# rubyの設定
  eval "$(rbenv init -)"

# PHPの設定
  [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
  export PATH="$PATH:~/.composer/vendor/bin"

# pythonの設定
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

# C#(mono)の環境設定 "mcs" path
  export PATH="$PATH:/Applications/Unity/Unity2017.2.0f3.app/Contents/MonoBleedingEdge/bin/"



# Gitの設定
  #プロンプトの配置、色変更、Gitのブランチ名表示、補完機能
    # 項目設定：
    # \h ホスト名（最初の.まで）
    # \H ホスト名
    # \W ディレクトリ
    # \w ディレクトリ（フルパス）
    # \u ユーザ名
    # \t 時間

    # 色の設定：
    #
    # 黒	\[\e[0;30m\]色をつけたい部分\[\e[0;0m\]
    # 赤	\[\e[0;31m\]色をつけたい部分\[\e[0;0m\]
    # 緑	\[\e[0;32m\]色をつけたい部分\[\e[0;0m\]
    # 黄	\[\e[0;33m\]色をつけたい部分\[\e[0;0m\]
    # 青	\[\e[0;34m\]色をつけたい部分\[\e[0;0m\]
    # 紫	\[\e[0;35m\]色をつけたい部分\[\e[0;0m\]
    # 水	\[\e[0;36m\]色をつけたい部分\[\e[0;0m\]
    # 白	\[\e[0;37m\]色をつけたい部分\[\e[0;0m\]
    source PATH="/usr/local/etc/bash_completion.d/git-prompt.sh"
    # source /usr/local/etc/bash_completion.d/git-completion.bash
    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1="\n\n■  \[\e[0;31m\]\u\[\e[0;0m\] \[\e[0;35m\]\w\[\e[0;0m\] \t \[\033[00m\]\[\033[31m\]$(__git_ps1 %s)\[\033[00m\]\n\[\e[0;36m\]\$\[\e[0;0m\] "

# TwitterAPI
    export CONSUMER_KEY=HB0BwlhXsLdhGdkpEw2fluFp1
    export CONSUMER_SECRET=kqSnGgrUdcDf0VWgale5whqydz0Ma9Vels8a4LiEOzZ3N8SDAU
    export ACCESS_TOKEN=906537747204079616-ptLVSyznCRIXZ76952m4nK0s3q4j1ZI
    export ACCESS_TOKEN_SECRET=GMVMvrLUCCnkhvzuxfVwHufc2q5aoB3cJ0oRWtPE6WYDJ

# Homebrew settings
    export PATH="/usr/local/bin:$PATH"

# bzip2 settings
    export PATH="/usr/local/opt/bzip2/bin:$PATH"

# NeoVim
    export XDG_CONFIG_HOME="$HOME/.config"

# diff-highlightにPATHを通す
    export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"

# サーチパスに~/binを追加
    export PATH="$PATH:~/bin"

# PATHのユニーク処理
_path=""
for _p in $(echo $PATH | tr ':' ' '); do
  case ":${_path}:" in
    *:"${_p}":* )
      ;;
    * )
      if [ "$_path" ]; then
        _path="$_path:$_p"
      else
        _path=$_p
      fi
      ;;
  esac
done
PATH=$_path

unset _p
unset _path
