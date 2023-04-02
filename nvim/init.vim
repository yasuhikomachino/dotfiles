call plug#begin('~/.config/nvim')
  Plug 'cocopon/iceberg.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdtree'
  Plug 'mattn/emmet-vim'
  Plug 'alvan/vim-closetag'
call plug#end()

let mapleader = " "

set list listchars=tab:»·,trail:·,nbsp:·,space:·,
set list
set nowritebackup
set nobackup
set virtualedit=block
set backspace=indent,eol,start
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set noerrorbells
set showmatch matchtime=1
set cinoptions+=:0
set cmdheight=2
set laststatus=2
set showcmd
set display=lastline
set history=10000
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R
set showmatch
set smartindent
set noswapfile
set nofoldenable
set title
set number
set clipboard+=unnamed
set nrformats=
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set signcolumn=yes
set laststatus=2
set cmdheight=2
set showtabline=2
set splitright
set nowrap

syntax enable
filetype plugin indent on
colorscheme iceberg

inoremap jj <ESC>

" ----
" window
" ----
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-

" ----
" tab
" ----
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" ----
" search
" ----
nnoremap <Esc><Esc> :n:ohlsearch<CR><ESC>

" ----
" fzf
" ----
nnoremap <Leader>ff :FZF<CR>

" ----
" NERDTree
" ----
nnoremap <C-e> :NERDTreeToggle<CR>


