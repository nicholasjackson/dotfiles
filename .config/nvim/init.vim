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
Plugin 'keith/swift.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jparise/vim-graphql'
Plugin 'rust-lang/rust.vim'
Plugin 'git@github.com:hashicorp/sentinel.vim.git'

" Terraform
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'

" themes
Plugin 'arcticicestudio/nord-vim'
Plugin 'albertorestifo/github.vim'

" Highlight indent
Plugin 'nathanaelkane/vim-indent-guides'

" Neomake
Plugin 'neomake/neomake'

" Gists
Plugin 'lambdalisue/vim-gista'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'
Plugin 'mitsuse/autocomplete-swift'
Plugin 'sebastianmarkow/deoplete-rust'

" NerdTree explorer
Plugin 'scrooloose/nerdtree'

" Status bar
Plugin 'itchyny/lightline.vim'

" Ack file searcher
Plugin 'mileszs/ack.vim'

" Git
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-git.git'

" Super tab
Plugin 'ervandew/supertab'

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
set guifont=Source\ Code\ Pro\ 15
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
colorscheme nord
" Indent guide
let g:indent_guides_enable_on__startup = 1
let g:indent_guides_auto_colors        = 1
hi IndentGuidesOdd  ctermbg               = 236
hi IndentGuidesEven ctermbg               = 235

" -------   Go IDE -----------------------------
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = "goimports"
let g:go_def_mapping_enabled         = 1
let g:go_auto_type_info              = 1
let g:go_term_enabled                = 1
"let g:go_list_type                   = "quickfix"

" gometalinter configuration
let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "20s"
"let g:go_metalinter_enabled = [
"    \ 'deadcode',
"    \ 'errcheck',
"    \ 'gas',
"    \ 'goconst',
"    \ 'gocyclo',
"    \ 'golint',
"    \ 'gosimple',
"    \ 'ineffassign',
"    \ 'vet',
"    \ 'vetshadow'
"    \]
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['gotype', 'vet', 'golint']

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

"------------------------------------------------------------------------------
" NeoComplete
"------------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <silent><TAB><TAB> <C-x><C-o>

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
let g:neocomplete#force_omni_input_patterns.terraform = '[^ *\t"{=$]\w*'

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

"le:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" ------------------------ lightbar settings ---------------------------
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ], 
      \              [ 'linter_warnings', 'linter_errors', 'linter_ok' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'component_type': {
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'ok',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return ''
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
       return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
           \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
           \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

autocmd User ALELint call lightline#update()

" ale + lightline
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d --', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d >>', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

" Syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 3
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck', 'gosimple', 'staticcheck']
"let g:syntastic_ruby_checkers = ['mri', 'rubocop']
"let g:tastic_swift_checkers = ['swiftpm', 'swiftlint']
"let g:syntastic_ignore_files = ['\.s$']

function! s:syntastic()
  SyntasticCheck
    call lightline#update()
endfunction

" ======================== ale ========================
"let g:ale_linters = {
"  \ 'html': [],
"  \ 'javascript': ['eslint'],
"  \ 'go': ['gometalinter']
"  \ }
"
"let g:ale_go_gometalinter_options = '
"  \ --aggregate
"  \ --fast
"  \ --sort=line
"  \ --vendor
"  \ --vendored-linters
"  \ --disable=gas
"  \ --disable=goconst
"  \ --disable=gocyclo
"  \ '
"let g:ale_set_highlights = 0
"let g:ale_set_signs = 1
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '⚠'
"let g:ale_warn_about_trailing_whitespace = 0
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1
"hi ALEErrorSign   ctermfg=15 ctermbg=236
"hi ALEInfoSign    ctermfg=15 ctermbg=236
"hi ALEWarningSign ctermfg=15 ctermbg=236

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

" Terraform
let g:terraform_fmt_on_save = 1

augroup filetypedetect
  au BufRead,BufNewFile *.hcl set filetype=terraform
augroup END

augroup filetypedetect
  au BufRead,BufNewFile *.nomad set filetype=terraform
augroup END

" Disableneocomplete.
let g:neocomplete#enable_at_startup = 0

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'

" Skip the check of neovim module
let g:python3_host_skip_check = 0

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup        = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']

" React
let g:jsx_ext_required = 0

" Javascript
let g:syntastic_javascript_checkers = ['jslint', 'jshint']

" Markdown
let g:vim_markdown_folding_disabled = 1

nmap <BS> <C-W>h

" Spelling
autocmd BufRead,BufNewFile *.md setlocal spell

" Gitsta
let g:gista#client#default_username = 'nicholasjackson'

" Terraform
let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_completion_keys = 1
