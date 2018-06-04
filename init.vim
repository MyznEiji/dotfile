if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:python_file = fnamemodify(expand('<sfile>'), ':h').'/python.toml'
let s:lazy_file = fnamemodify(expand('<sfile>'), ':h').'/lazy.toml'
let s:php_file = fnamemodify(expand('<sfile>'), ':h').'/php.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:python_file, {'lazy': 1})
  call dein#load_toml(s:lazy_file, {'lazy': 1})
  call dein#load_toml(s:php_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く



" " :----------------------------------------------------------
" " setting for vim editor
" "----------------------------------------------------------
" " show number 
" set number
" " use backspace
" set backspace=indent,eol,start
" " a case-insensitive search
" set ignorecase
" "  if a pattern contains an uppercase letter, it is case sensitive 
" set smartcase
" " enable Yank and Put
" set clipboard=unnamed
" " enable mouse
" set mouse=a
" " escape with jj
" inoremap <silent> jj <ESC>
" " On pressing tab, insert 2 spaces 
" set expandtab
" " show existing tab with 2 spaces width 
" set tabstop=2
" " when indenting with '>', use 2 spaces width 
" set shiftwidth=2
" " Highlight current line
" set cursorline
" " highlight matching parenthesis
" set showmatch
" " show status line 
" set laststatus=2
" " set terminal title
" set title
" " don't make swap file
" set noswapfile
" " automatically inserts one extra level of indentation in some cases 
" set smartindent
" " escape select when search some word with esc
" nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><C-l>
" " escape paste mode when leave insert mode
" autocmd InsertLeave * set nopaste
" " syntax in markdown file for bold, italic
" " hi link htmlItalic WarningMsg
" " hi link htmlBold WarningMsg
" " hi link htmlBoldItalic ErrorMsg
" "----------------------------------------------------------
