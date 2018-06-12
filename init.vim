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
  let s:ruby_toml    = g:rc_dir . '/ruby.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,        {'lazy': 0})
  call dein#load_toml(s:lazy_toml,   {'lazy': 1})
  call dein#load_toml(s:python_toml, {'lazy': 1})
  call dein#load_toml(s:php_toml,   {'lazy': 1})
  call dein#load_toml(s:js_toml,   {'lazy': 1})
  call dein#load_toml(s:ruby_toml,   {'lazy': 1})

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
" 列を強調表示
set cursorcolumn
" highlight matching parenthesis
set showmatch
" show status line
set laststatus=2
" set terminal title
set title
" automatically inserts one extra level of indentation in some cases
set smartindent
" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile
" escape select when search some word with esc
nnoremap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><C-l>
" escape paste mode when leave insert mode
autocmd InsertLeave * set nopaste
" 折り返さない
set nowrap




" シンタックスハイライトの最大行数
set synmaxcol=200
" シンタックスハイライト
syntax on
" .vueシンタックスハイライト
autocmd BufNewFile,BufRead *.vue set filetype=html
" 全角スペースのハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" for lightline.vim
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified', 'anzu']
  \   ]
  \ },
  \ 'component_function': {
  \   'anzu': 'anzu#search_status'
  \ }
  \ }



" keymap setting
 imap <C-p> <Up>
 imap <C-n> <Down>
 imap <C-b> <Left>
 imap <C-f> <Right>
 imap <C-e> <END>
 imap <C-a> <HOME>
 imap <C-d> <Del>
 imap <C-k> <C-r>=<SID>kill()<CR>

 function! s:kill()
   let [text_before, text_after] = s:split_line()
   if len(text_after) == 0
   ¦ normal! J
   else
   ¦ call setline(line('.'), text_before)
   endif
   return ''
 endfunction

 function! s:split_line()
   let line_text = getline(line('.'))
   let text_after  = line_text[col('.')-1 :]
   let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
   return [text_before, text_after]
 endfunction


noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $



" リーダーキーをスペースに設定
let mapleader = "\<Space>"

let g:python3_host_prog = expand('/usr/local/bin/python3')



" ctagsの設定
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis


" カレントディレクトリから、ホームディレクトリまで.tagsを探します
set tags=.tags;$HOME

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


