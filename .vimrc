" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/Users/miyataasami/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/Users/miyataasami/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif

"----------------------------------------------------
"----------------------------------------------------

colorscheme evening

" vim内部で使用される文字コード
set encoding=utf-8
" バッファのファイルの文字コード（fileencodingが空の場合はencodingと同じ値となるため外す
"set fileencoding=utf-8
" 編集開始時に考慮する文字コード(自動判別の設定)
set fileencodings=utf-8 
"ファイルフォーマット
set fileformats=unix,dos,mac

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set list
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
"set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
"set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻るをオフにする
set nowrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" 括弧入力後改行した際、括弧の補完とカーソルを入力位置に移動
" neocompleteでまかなえているのでコメントアウト
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

" スクロールを滑らかにする
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" ファイルを開く際リスト表示・選択できるようにする
set wildmenu wildmode=list:full

" syntaxが消えてしまったりする際使用
"redrawtime=10000

" マウスを使う場合
"set mouse=a
"set ttymouse=xterm2

" 最後にヤンクしたものをペースト
nnoremap P "0p<CR>

" Leader
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" ESC代替え
noremap! jj <ESC> 

" バックスペースが効かないため
set backspace=indent,eol,start

" 列をハイライト
set cursorcolumn
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

