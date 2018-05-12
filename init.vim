"----------------------------------------------------------
" dein, toml setting scripts
"----------------------------------------------------------
if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" set each directory path
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:nvim_home = s:config_home . '/nvim'
let s:dein_dir = s:nvim_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" when you hava dein.vim, install it from github
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . "," . &runtimepath

" set toml files which manege plugins
let s:toml_dir = s:nvim_home . '/toml'
let s:toml_file = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

" start setting
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOMLを読み込み、キャッシュしておく
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end setting
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" install plugins that not installed yet
if dein#check_install()
  call dein#install()
endif
"----------------------------------------------------------

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

"----------------------------------------------------------
" ctags
"----------------------------------------------------------
" split vertically with ctrl+h
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" split horizontally with ctrl+k
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 
"----------------------------------------------------------

"----------------------------------------------------------
" don't use for now
"----------------------------------------------------------
" " color for completion
" highlight Pmenu ctermfg=white ctermbg=darkblue
" highlight PmenuSel ctermfg=white ctermbg=gray
"----------------------------------------------------------

"----------------------------------------------------------
" python
"----------------------------------------------------------
let g:python_host_prog = "/Users/daikirokuyama/.pyenv/versions/2.7.14/envs/neovim2/bin/python"
let g:python3_host_prog = "/Users/daikirokuyama/.pyenv/versions/3.6.4/envs/neovim3/bin/python"
"----------------------------------------------------------
