filetype plugin on
syntax on

" https://github.com/lifepillar/vim-solarized8
" https://qiita.com/yami_beta/items/ef535d3458addd2e8fbb
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ハイライトサーチを有効にする
set hlsearch
" 大文字小文字を区別しない(検索時)
set ignorecase
" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase

" カーソル位置が右下に表示される set ruler
" 行番号を付ける
set number
" タブ文字の表示 (^I で表示される)
set list
" コマンドライン補完が強力になる
set wildmenu
" コマンドを画面の最下部に表示する
set showcmd

" 改行時にインデントを引き継いで改行する
set autoindent
" インデントにつかわれる空白の数
set shiftwidth=4
" <Tab>押下時の空白数
set softtabstop=4
" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab
" <Tab>が対応する空白の数
set tabstop=4

" インクリメント、デクリメントをhexにする
set nf=hex
" マウス有効化
set mouse=a

" 無名レジスタに入るデータを、*レジスタにも入れる
set clipboard=unnamedplus
set clipboard+=autoselect

" ファイルタイプでインデントを決める
filetype plugin indent on

if &compatible
  set nocompatibl
endif


set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.cache/dein'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('t9md/vim-quickhl')
call dein#add('jceb/vim-hier')
call dein#add('adie/BlockDiff')
call dein#end()

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif