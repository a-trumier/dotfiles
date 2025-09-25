filetype indent off
let mapleader = '\'
set encoding=UTF-8
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'raimondi/delimitmate'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-smooth-scroll'
Plug 'preservim/tagbar'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

call plug#end()

filetype plugin indent on

let base16colorspace=256
colorscheme twilight256
autocmd vimenter * colorscheme twilight256
let g:tagbar_width = winwidth(0) * 80/100

let g:tabman_toggle = '<leader>mt'
let g:tabman_focus  = '<leader>mf'
let g:limelight_conceal_ctermfg = 'gray'
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :NERDTreeFocus<CR>
nnoremap <C-p> :TagbarToggle<CR>
set encoding=utf-8

let g:webdevicons_enable_nerdtree = 1

set completeopt+=menuone

set colorcolumn=80
autocmd VimEnter * highlight ColorColumn ctermbg=9 guibg=lightgrey 
" macros
let @c = "i/*/€ý5kA €ý5"
let @d = "i/* */€ý5hhi"
" regular stuff below

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
