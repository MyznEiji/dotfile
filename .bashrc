echo -e "\e[32m       ___           ___           ___           ___           ___           ___      " 
echo -e "\e[32m      /\  \         /\  \         /\  \         /\__\         /\  \         /\  \     " 
echo -e "\e[32m     /::\  \       /::\  \       /::\  \       /:/  /        /::\  \       /::\  \    " 
echo -e "\e[32m    /:/\:\  \     /:/\:\  \     /:/\ \  \     /:/__/        /:/\:\  \     /:/\:\  \   " 
echo -e "\e[32m   /::\~\:\__\   /::\~\:\  \   _\:\~\ \  \   /::\  \ ___   /::\~\:\  \   /:/  \:\  \  "    
echo -e "\e[32m  /:/\:\ \:|__| /:/\:\ \:\__\ /\ \:\ \ \__\ /:/\:\  /\__\ /:/\:\ \:\__\ /:/__/ \:\__\ "
echo -e "\e[32m  \:\~\:\/:/  / \/__\:\/:/  / \:\ \:\ \/__/ \/__\:\/:/  / \/_|::\/:/  / \:\  \  \/__/ "
echo -e "\e[32m   \:\ \::/  /       \::/  /   \:\ \:\__\        \::/  /     |:|::/  /   \:\  \       " 
echo -e "\e[32m    \:\/:/  /        /:/  /     \:\/:/  /        /:/  /      |:|\/__/     \:\  \      " 
echo -e "\e[32m     \::/__/        /:/  /       \::/  /        /:/  /       |:|  |        \:\__\     " 
echo -e "\e[32m      ~~            \/__/         \/__/         \/__/         \|__|         \/__/     " 



# エイリアスの設定
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias typora="open -a typora"
alias less='less -X'
# lsの結果を見やすくする
alias ls="ls -GAF"
alias lsf="ls | fzf"
# cdと同時にlsする
function cdls() {
  # cdがaliasでループするので\をつける
  \cd $1;
  ls;
}
alias cd=cdls

# history x fzf
alias hisf="history | fzf"

# shell系のエイリアス
alias bp='vi ~/dotfiles/.bash_profile'
alias br='vi ~/dotfiles/.bashrc'
alias zr='vi ~/dotfiles/.zshrc'
alias zp='vi ~/dotfiles/.zprofile'
alias sbp='source ~/dotfiles/.bash_profile'
alias szp='source ~/dotfiles/.zprofile'
alias sbr='source ~/dotfiles/.bashrc'
alias szr='source ~/dotfiles/.zshrc'


# EveryDayTaskCommand エイリアス
alias morningTask='python3 /Users/miyazonoeiji/projects/python/everdayTask/startMorningTask.py'
alias markdownTask='python3 /Users/miyazonoeiji/projects/python/everdayTask/startMarkdown.py'
alias englishTask='python3 /Users/miyazonoeiji/projects/python/everdayTask/startEnglish.py'
alias checkWeb='python3 /Users/miyazonoeiji/projects/python/everdayTask/startWebSite.py'
alias checkBlog='python3 /Users/miyazonoeiji/projects/python/everdayTask/startBlog.py'
alias checkYoutube='python3 /Users/miyazonoeiji/projects/python/everdayTask/startYouTube.py'


# githubのエイリアス
alias github='open https://github.com/'

# Udemyのエイリアス
alias udemy='open https://www.udemy.com/home/my-courses/learning/'

# TechCamp系のエイリアス
alias techmaster='open https://master.tech-camp.in/'
alias techcamp='python3 /Users/miyazonoeiji/projects/python/jobcan/jobcan.py'


# neovimのエイリアス
alias vi='nvim'


# KeyboardCleabTool起動
alias keystop='open -a /Applications/KeyboardCleanTool.app/'


# HowToをopen
alias howto='typora ~/projects/markDown/howToUse'


# シェル切り替え
alias csb='chsh -s /bin/bash'
alias csz='chsh -s /bin/zsh'


# tmux起動
alias tmux_cus='tmux new-session \; source-file ~/.tmux/session'


#alias tmux
alias tm='tmux'
alias ta="tmux a"
alias tl="tmux ls"
alias tk="tmux kill-session"
alias tfin="tmux kill-server"

# 隠しファイルモードON
show_hedden_files()
{
    defaults write com.apple.finder AppleShowAllFiles TRUE 
    killall Finder
}
alias sfile="show_hedden_files"


# 隠しファイルモードOFF
hide_hedden_files()
{
     defaults write com.apple.finder AppleShowAllFiles FALSE  
     killall Finder
}
alias hfile="hide_hedden_files"


# 天気予報
alias weather="curl wttr.in/Tokyo"


# iTunesPlay
alias mst="iTunesPlay"

# iTunesStop
alias mfin="iTunesStop"

#ls -Gのcolor設定
  # 設定できる属性とデフォルト色
    # 順番	属性	デフォルト色(文字色 x 背景色)	設定
    # 1	ディレクトリ	青 x 背景色	ex
    # 2	シンボリックリンク	マゼンダ x 背景色	fx
    # 3	ソケットファイル	緑 x 背景色	cx
    # 4	FIFO特殊ファイル	茶 x 背景色	dx
    # 5	実行ファイル	赤 x 背景色	bx
    # 6	ブロック型特殊ファイル	青 x シアン	eg
    # 7	キャラクタ型特殊ファイル	青 x 茶	ed
    # 8	setuid bit が設定された実行形式	黒 x 茶	ab
    # 9	setgid bit が設定された実行形式	黒 x シアン	ag
    # 10	他者が書き込み可能なディレクトリ、sticky bit 付き	黒 x 緑	ac
    # 11	他者が書き込み可能なディレクトリ、sticky bit 無し	黒 x 茶	ad


  # 使える色一覧
    # 設定値	色
    # a	黒
    # b	赤
    # c	緑
    # d	茶
    # e	青
    # f	マゼンタ
    # g	シアン
    # h	明い灰
    # A	太字の黒で、通常暗い灰に見える
    # B	太字の赤
    # C	太字の緑
    # D	太字の茶で、通常黄色に見える
    # E	太字の青
    # F	太字のマゼンタ
    # G	太字のシアン
    # H	太字の明い灰で、明い白に見える
    # x	デフォルトの前景色と背景色

  #export LSCOLORS=exfxcxdxbxegedabagacad デフォルト
   export LSCOLORS=gxfxcxdxbxegedabagacad



#コマンド履歴
HISTSIZE=1000000
HISTFILESIZE=1000000

#パス追加、削除関係の関数
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }


# sourceコマンドでのサーチパス検索をやめさせる
# shopt -u sourcepath


