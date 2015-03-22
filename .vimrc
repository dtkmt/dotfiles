""" General
 " vi非互換モード
set nocompatible
set history=500
 " .swapファイルを作らない
set noswapfile
 " バックアップファイルを作らない
set nowritebackup
 " バックアップをしない
set nobackup
 " バックスペースで各種消せるようにする
set backspace=indent,eol,start
 " ビジュアルベルを有効化
set visualbell
 " clipboradとyankを同期
set clipboard+=unnamed
set clipboard+=autoselect
 " serch highlight を消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" paste mode
set paste

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,enc-jp,cp932
" インクリメンタルサーチを行う
set incsearch
" スクロールする時に下が見えるようにする
set scrolloff=5

" View
colorscheme desert
syntax on
set number
set title
set ruler

" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
:set list
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
:set listchars=tab:>-,extends:<,trail:-,eol:<

" File system
set nobackup

" Filetype specific settings
" Set any other file type specific settings
" in ~/.vim and ~/.vim/after
" Type :set runtimepath to see you runtime path.
filetype plugin indent on

" Other programming staffs
set showmatch
set matchtime=3

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4

set expandtab
" タブをタブとして扱う(スペースに展開しない)
" set noexpandtab
" set softtabstop=0

" ----------------------------------------------------------------------------------------
"   neobundle
" ----------------------------------------------------------------------------------------

let g:neobundle_default_git_protocol='git'

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
                \ 'windows' : 'make -f make_mingw32.mak',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'unix' : 'make -f make_unix.mak',
        \ },
\ }

filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

NeoBundle 'thinca/vim-quickrun'
" 自動補完
NeoBundle "Shougo/neocomplete.vim"
" NeoBundle 'davidoc/taskpaper.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'pentie/vimrepress'
NeoBundle 'tpope/vim-markdown'
NeoBundle "scrooloose/syntastic"
"GitHub以外のGitリポジトリにあるプラグインを利用する
NeoBundle 'git://git.wincent.com/command-t.git'
"MarkdownファイルをブラウザでPreviewする
NeoBundle 'tukiyo/previm'
" NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
"vimでgit を使う
NeoBundle 'tpope/vim-fugitive'
"Git以外のリポジトリにあるプラグインを利用する
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
NeoBundle 'andviro/flake8-vim'
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
NeoBundle 'vim-scripts/rdark'
" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'
" hybryd カラースキーム
NeoBundle 'w0ng/vim-hybrid'
" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
" filer nerd-tree
NeoBundle 'scrooloose/nerdtree'

" Installation check.
NeoBundleCheck

au BufRead,BufNewFile *.md  set filetype=markdown

set colorcolumn=80
" 自動的に改行が入るのを無効化
set textwidth=0

" Previm config
nnoremap <silent><C-o> :PrevimOpen<CR>
" NERD-tree config
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" neocomplete config
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>
set wildmode=longest:full,full
