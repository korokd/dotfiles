" General settings
set nocompatible
set hidden
set encoding=utf-8
set ttyfast
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set shell=/bin/sh
set number relativenumber

" Fix backspace indent
set backspace=indent,eol,start

filetype plugin indent on
syntax on

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Outlining
Plug 'majutsushi/tagbar'

" Git
Plug 'airblade/vim-gitgutter'

" Language server client
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'elmcast/elm-vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" Map <leader> to `,`
let mapleader=','

" Format on save .elm
let g:elm_format_autosave = 1

" Disable Coc warning Node is too old
let g:coc_disable_startup_warning = 1

" Keybindings
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>p :call CocActionAsync('format')<CR>
