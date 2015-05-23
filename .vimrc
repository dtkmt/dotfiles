" -----------------------------------------------------------------------------
"   General
" -----------------------------------------------------------------------------
set nocompatible                             " vi非互換モード
set history=5000                             " vim 実行履歴数
set noswapfile                               " .swapファイルを作らない
set backspace=indent,eol,start               " バックスペースで各種消せるようにする
set visualbell                               " ビジュアルベルを有効化
set matchpairs& matchpairs+=<:>              " 対応括弧に<と>のペアを追加
set nopaste                                  " paste mode を無効化
set enc=utf-8                                " 内部エンコードを utf-8 
set fenc=utf-8                               " ファイル書き込み時のエンコード
set fencs=utf-8,iso-2022-jp,enc-jp,cp932     " ファイル読み込み時のエンコード
set incsearch                                " インクリメンタルサーチを行う
set scrolloff=5                              " スクロールする時に下が見えるようにする
set list                                     " タブ文字 CTRL-I で表示  行末に $ 
set listchars=tab:>-,extends:<,trail:-,eol:< " Listモード 使われる文字を設定する。
set nobackup                                 " バックアップファイルを作成しない
set showmatch                                " 対応する括弧を表示
set matchtime=3                              " 対応する括弧を3秒表示
set tabstop=4                                " タブを表示するときの幅
set shiftwidth=4                             " タブを挿入するときの幅
set expandtab                                " タブを半角スペースとして入力
" set noexpandtab                              " タブをタブとして扱う(スペースに展開しない)
" set softtabstop=0                            " タブバックスペースでカーソルが動く幅
set colorcolumn=80                           " 80文字目に縦線
set textwidth=0                              " 自動的に改行が入るのを無効化
set t_Co=256                                 " 文字色を256色に設定
let g:rehash256 = 1                          


" -----------------------------------------------------------------------------
"   Search
" -----------------------------------------------------------------------------
set ignorecase                               " 大文字小文字を区別しない
set smartcase                                " 小文字で検索すると ignorecase無効
set wrapscan                                 " ファイル先頭に戻る
set hlsearch                                 " 対象をハイライト
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>   " serch highlight を消す


" -----------------------------------------------------------------------------
"  neobundle
" -----------------------------------------------------------------------------

if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck


" -----------------------------------------------------------------------------
"  Color Scheme
" -----------------------------------------------------------------------------
NeoBundle 'w0ng/vim-hybrid'                       " colorscheme hybrid
NeoBundle 'altercation/vim-colors-solarized'      " colorscheme solarized
NeoBundle 'nanotech/jellybeans.vim'               " colorscheme jellybeans
NeoBundle 'tomasr/molokai'                        " colorscheme molokai


" -----------------------------------------------------------------------------
"  Unite
" -----------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'


" -----------------------------------------------------------------------------
"  NERD-tree  
" -----------------------------------------------------------------------------
NeoBundle "scrooloose/nerdtree"
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" -----------------------------------------------------------------------------
"  Neocomplete
" -----------------------------------------------------------------------------

if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

" --------------------------------------------------------------------
"  Coffee Setting
" --------------------------------------------------------------------

NoeBundle 'kchmck/vim-coffee-script'

" --------------------------------------------------------------------
"  Python Setting
" --------------------------------------------------------------------

" sytastic: syntax check plugin
NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ["flake8"]

" jedi-vim: Python用補完plugin
NeoBundleLazy "davidhalter/jedi-vim", {
  \ "autoload": {
  \   "filetypes": ["python", "python3", "djangohtml"],
  \ },
  \ "build" : {
  \   "mac"  : "pip install jedi",
  \   "unix" : "pip install jedi",
  \ }}
let g:jedi#rename_command = '<Leader>R'
let g:jedi#goto_assignments_command = '<Leader>G'
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

" vim-flake8: Error一覧を画面下部に表示
NeoBundleLazy "nvie/vim-flake8", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
" buffer保存時に flake8 を実行
" autocmd BufWritePost *.py call Flake8()


call neobundle#end()
" --------------------------------------------------------------------
"   View 
" --------------------------------------------------------------------
set showmatch    " 括弧の対応をハイライト
set showcmd      " 入力中のコマンドを表示
set showmode     " 現在のモードを表示
set number       " 行番号表示
set list         " 不可視文字表示
set notitle      " タイトル書き換えない
set scrolloff=5  " 行送り
set number       " 行番号を表示
set title        " タイトルを表示
set ruler        " カーソル位置を表示

" --------------------------------------------------------------------
"   Color Sheme 
" --------------------------------------------------------------------
"" hybrid
let g:hybrid_use_Xresources = 1                    " hybrid用の色設定を読み込み
hi CursorLineNr ctermbg=4 ctermfg=0                " カーソル行の行番号色を変更
set cursorline                                     " カーソル行をハイライト
hi clear CursorLine                                " カーソル行の色を変更
autocmd ColorScheme * highlight LineNr ctermfg=239 " 番号色を変更
colorscheme hybrid                                 " カラースキーマを hybrid に設定
filetype plugin indent on                          " ファイルタイプ毎に固有の設定を有効化
syntax enable                                      " ハイライトを有効化


" --------------------------------------------------------------------
"  File Type
" --------------------------------------------------------------------
" .md を ファイルタイプ markdown  として扱う
au BufRead,BufNewFile *.md  set filetype=markdown
