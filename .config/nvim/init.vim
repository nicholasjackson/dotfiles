set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" Languages
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jparise/vim-graphql'
Plugin 'hashicorp/sentinel.vim'

" Terraform
Plugin 'hashivim/vim-terraform'
"Plugin 'juliosueiras/vim-terraform-completion'

" themes
Plugin 'sonph/onehalf', {'rtp': 'vim/'}

" Highlight indent
Plugin 'nathanaelkane/vim-indent-guides'

" Neomake
Plugin 'neomake/neomake'

" Gists
Plugin 'lambdalisue/vim-gista'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'

" NerdTree explorer
Plugin 'scrooloose/nerdtree'

" Status bar
Plugin 'vim-airline/vim-airline'

" Ack file searcher
Plugin 'mileszs/ack.vim'

" Git
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-git.git'

" Super tab
Plugin 'ervandew/supertab'

Plugin 'christoomey/vim-tmux-navigator'


" Syntax checking
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'

" Fix indentation
Plugin 'junegunn/vim-easy-align'

" Tagbar to view tags in right hand column
Plugin 'majutsushi/tagbar'

" Dash
Plugin 'rizzatti/dash.vim'

" Markdown
Plugin 'itspriddle/vim-marked'

" Utility
Plugin 'vim-scripts/SyntaxAttr.vim'

call vundle#end() " required

filetype plugin indent on

set nobackup
set nowb
set noswapfile
set lazyredraw
set hid

" Turn on the WiLd menu
set wildmenu

" Set command-line completion mode
set wildmode=list:longest,full

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Text formatting
"set anti enc=utf-8
"set guifont=Hack
set sw=2
set ts=2
set softtabstop=2
set expandtab
set number
set clipboard=unnamed

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" add vertical lines on columns
set colorcolumn=80,120

syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"colorscheme onehalflight
colorscheme onehalfdark

let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1

"colorscheme nord
"" Indent guide
"let g:indent_guides_enable_on__startup = 1
"let g:indent_guides_auto_colors        = 1
"hi IndentGuidesOdd  ctermbg            = 236
"hi IndentGuidesEven ctermbg            = 235

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_test_prepend_name = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_null_module_warning = 0
let g:go_echo_command_info = 1

let g:go_autodetect_gopath = 1

let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['golint', 'govet', 'typecheck']
let g:go_metalinter_command='golangci-lint'

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 0
let g:go_highlight_function_calls = 0
let g:go_gocode_propose_source = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_fold_enable = []

" wrap long lines in quickfix
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

set timeoutlen=400 ttimeoutlen=0

" Deoplete
"
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'go': '[^. *\t]\.\w*',
\})

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" ================  Ctrl P settings ===========================
let g:ctrlp_max_files    = 10000
let g:ctrlp_max_depth    = 40
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

" Vim Test
let g:test#preserve_screen = 1

" Custom key commands
let mapleader = ","
let g:mapleader = ","

" Open Ack and put the cursor in the right position
map <leader>a :Ack<space>
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue 
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

map <C-p>           : CtrlP<CR>
map <C-t>           : CtrlPBufTag<CR>
map <leader>p       : CtrlPBuffer<CR>
map <F6>            : NERDTreeToggle<CR>
map <F8>            : TagbarToggle<CR>
map <silent> <C-k>  : wincmd k<CR>
map <silent> <C-j>  : wincmd j<CR>
map <silent> <C-l>  : wincmd l<CR>
nmap <silent> <C-h> : wincmd h<CR>
map -a	            : call SyntaxAttr()<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Remap arrow keys
noremap <Up>    <nop>
noremap <Down>  <nop>
noremap <Left>  <nop>
noremap <Right> <nop>

" Markdown settings
let g:_markdown_folding_disabled = 1

" Rust
let g:deoplete#sources#rust#racer_binary='/Users/nicj/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/uslocal/Cellar/rust/1.20.0/lib/rustlib/src/rust/src'

" Dart
let g:deoplete#sources#dart#dart_sdk_path='/Users/nicj/dart-sdk/'

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
let g:python_host_prog  = '/usr/local/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 0

" React
let g:jsx_ext_required = 0

" Javascript
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

" YAML
let g:syntastic_yaml_checkers = ['yamllint']

" Markdown
let g:vim_markdown_folding_disabled = 1

nmap <BS> <C-W>h

" Spelling
autocmd BufRead,BufNewFile *.md setlocal spell

" Gitsta
let g:gista#client#default_username = 'nicholasjackson'

" Terraform
"let g:terraform_completion_keys = 1
"let g:terraform_registry_module_completion = 0

let g:terraform_align=1

" HCL 
augroup filetypedetect
  au! BufRead,BufNewFile *.hcl setf terraform
augroup END

call deoplete#initialize()
