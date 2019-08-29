set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/.bundle/Vundle.vim
call vundle#begin('~/.config/nvim/.bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Shougo/deoplete.nvim'
Plugin 'fatih/vim-go'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neomake/neomake'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set t_Co=256
set cursorline
set sw=2
set ts=2
set softtabstop=2
set expandtab
set number
set clipboard=unnamedplus

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"colorscheme onehalflight
colorscheme onehalfdark

let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1

let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

map <F6>            : NERDTreeToggle<CR>
map <silent> <C-k>  : wincmd k<CR>
map <silent> <C-j>  : wincmd j<CR>
map <silent> <C-l>  : wincmd l<CR>
nmap <silent> <C-h> : wincmd h<CR>

let g:ctrlp_max_files    = 10000
let g:ctrlp_max_depth    = 40
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

let g:neomake_open_list = 2
if executable('yamllint')
  let g:neomake_yaml_yamllint_maker = {
    \ 'args': ['-f', 'parsable'],
    \ 'errorformat': '%E%f:%l:%c: [error] %m,%W%f:%l:%c: [warning] %m' }
  let g:neomake_yaml_enabled_makers = ['yamllint']
endif
