if &compatible
  set nocompatible
endif


" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END



" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir      = expand('~/.config/nvim')
  let s:toml        = g:rc_dir . '/dein.toml'
  let s:lazy_toml   = g:rc_dir . '/lazy.toml'
  let s:python_toml = g:rc_dir . '/python.toml'
  let s:php_toml    = g:rc_dir . '/php.toml'
  let s:js_toml    = g:rc_dir . '/javascript.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,        {'lazy': 0})
  call dein#load_toml(s:lazy_toml,   {'lazy': 1})
  call dein#load_toml(s:python_toml, {'lazy': 1})
  call dein#load_toml(s:php_toml,   {'lazy': 1})
  call dein#load_toml(s:js_toml,   {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif




"----------------------------------------------------------
" setting for vim editor
"----------------------------------------------------------
" show number 
set number
" use backspace
set backspace=indent,eol,start
" a case-insensitive search
set ignorecase
"  if a pattern contains an uppercase letter, it is case sensitive 
set smartcase
" enable Yank and Put
set clipboard=unnamed
" enable mouse
set mouse=a
" escape with jj
inoremap <silent> jj <ESC>
" On pressing tab, insert 2 spaces 
set expandtab
" show existing tab with 2 spaces width 
set tabstop=2
" when indenting with '>', use 2 spaces width 
set shiftwidth=2
" Highlight current line
set cursorline
" highlight matching parenthesis
set showmatch
" show status line 
set laststatus=2
" set terminal title
set title
" don't make swap file
set noswapfile
" automatically inserts one extra level of indentation in some cases 
set smartindent
" escape select when search some word with esc
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><C-l>
" escape paste mode when leave insert mode
autocmd InsertLeave * set nopaste
" syntax in markdown file for bold, italic
" hi link htmlItalic WarningMsg
" hi link htmlBold WarningMsg
" hi link htmlBoldItalic ErrorMsg

"----------------------------------------------------------


" ctags setting 
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis

set tags=.tags;~

function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif

 " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END



" keymap setting
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" リーダーキーをスペースに設定
let mapleader = "\<Space>"

let g:python3_host_prog = expand('/usr/local/bin/python3')
