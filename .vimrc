"setting
"
"文字コードをUFT-8に設定
set fenc=utf-8
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
set clipboard+=unnamed
set clipboard=unnamedplus
set clipboard+=autoselect
set mouse=a
set ttymouse=xterm2
  
" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
""set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする

let mapleader = ","
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" Toggle paste mode on and off
map <leader>p :set paste<cr>
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
nmap _ <Plug>(operator-replace)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

""nmap s <Plug>Sneak_s
""nmap S <Plug>Sneak_S
""xmap s <Plug>Sneak_s
""xmap S <Plug>Sneak_S
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
nmap f <Plug>Sneak_t
nmap F <Plug>Sneak_T

nnoremap j gj
nnoremap k gk
nnoremap J 15j
nnoremap H ^
nnoremap K 15k
nnoremap L $
"vmap J 15j
vmap H ^
vmap K 15k
vmap L $
nnoremap gr :tabprevious
nnoremap <C-q> <C-v>
"" imap <C-v> <C-q>
""let g:asyncomplete_auto_popup = 0
" シンタックスハイライトの有効化
syntax enable
" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"アンダーバーを単語の区切りとして使用する
set iskeyword=_

"https://qiita.com/lighttiger2505/items/3065164798bc9cd615d4
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0


inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>
" これらは"<>"とか入力するときに手間になる
"inoremap { {}<LEFT>
"inoremap ( ()<LEFT>
"inoremap ' ''<LEFT>
"inoremap ` ``<LEFT>
"inoremap " ""<LEFT>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" モードによってカーソルの形状を変える 
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
"set hlsearch
" ESC連打でハイライト解除
"nmap <Esc><Esc> :nohlsearch<CR><Esc>
"ハイライトの無効化
set nohlsearch


let g:deoplete#enable_at_startup = 1


" Windows Subsystem for Linux で、ヤンクでクリップボードにコピー
if system('uname -a | grep Microsoft') != ''
    augroup myYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
endif

set nocompatible
filetype off

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#begin(expand('~/.vim/bundle/'))
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'easymotion/vim-easymotion'
call neobundle#end()
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-replace'
Plug 'itchyny/calendar.vim'
call plug#end()


nnoremap <silent><C-j>w :NERDTreeToggle<CR>
inoremap <silent>jj<ESC> 

if &compatible
  set nocompatible
endif
""" Add the dein installation directory into runtimepath
""set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
""
""if dein#load_state('~/.cache/dein')
""  call dein#begin('~/.cache/dein')
""
""  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
""  call dein#add('Shougo/deoplete.nvim')
""  if !has('nvim')
""    call dein#add('roxma/nvim-yarp')
""    call dein#add('roxma/vim-hug-neovim-rpc')
""  endif
""
""  call dein#end()
""  call dein#save_state()
""endif

filetype plugin indent on
syntax enable
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    ""nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


"コメントアウト ショートカットの実装

if has("autocmd")
    filetype plugin indent on
    autocmd FileType c           setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType c           nnoremap <buffer> <C-i> <Home>i//<Esc>
    autocmd FileType c           nnoremap <buffer> <C-f> <Home>"_x"_x<Esc>
    autocmd FileType c           nnoremap <buffer> <C-b> :make
    autocmd FileType c           nnoremap <buffer> <C-e> :make run

    autocmd FileType cpp         setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType cpp         nnoremap <buffer> <C-i> <Home>i//<Esc>
    autocmd FileType cpp         nnoremap <buffer> <C-f> <Home>"_x"_x<Esc>
    autocmd FileType cpp         nnoremap <buffer> <C-b> :make
    autocmd FileType cpp         nnoremap <buffer> <C-e> :make run

    autocmd FileType python      setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType python      nnoremap <buffer> <C-i> <Home>i#<Esc>
    autocmd FileType python      nnoremap <buffer> <C-f> <Home>"_x<Esc>
    autocmd FileType python      nnoremap <buffer> <C-e> :terminal python3 %

    autocmd FileType html        setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType html        nnoremap <buffer> <C-i> <End>a--><Esc><Home>i<!--<Esc>
    autocmd FileType html        nnoremap <buffer> <C-f> <End>xxx<Esc><Home>xxxx<Esc>

    autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType js          setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType javasctipt  nnoremap <buffer> <C-i> <Home>i//<Esc>
    autocmd FileType javasctipt  nnoremap <buffer> <C-f> <Home>xx<Esc>
    autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 noexpandtab

    autocmd FileType scala       setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType json        setlocal sw=2 sts=2 ts=2 noexpandtab

    autocmd FileType css         setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType css         nnoremap <buffer> <C-i> <End>a*/<Esc><Home>i/*<Esc>
    autocmd FileType css         nnoremap <buffer> <C-f> <End>xx<Esc><Home>xx<Esc>

    autocmd FileType scss        setlocal sw=2 sts=2 ts=2 noexpandtab
    autocmd FileType sass        setlocal sw=2 sts=2 ts=2 noexpandtab

    autocmd FileType sh          nnoremap <buffer> <C-i> <Home>i#<Esc>
    autocmd FileType sh          nnoremap <buffer> <C-f> <Home>x<Esc>
endif

" ctrrip
" 
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-j>f'
nnoremap <C-j>e :CtrlPMRUFiles<CR>   " 最近のファイル検索

" マルチカーソルの設定
" デフォルトのマッピング無効化
let g:VM_maps = {}
" <C-k>にバインド
let g:VM_maps['Find Under'] = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
" マルチカーソルを<C-c>で開場できるようにする
"
nnoremap <C-j>t :bo terminal<CR> 
nnoremap <C-j>g :Ag<CR>
"以下はvim sneakが動作しなくなるので保留
"nnoremap ; :
"nnoremap : ;
