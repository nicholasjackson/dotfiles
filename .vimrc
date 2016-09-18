set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" Languages
Plugin 'fatih/vim-go'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

" Darcular theme
Plugin 'dracula/vim'

" Highlight indent
Plugin 'nathanaelkane/vim-indent-guides'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'

" NerdTree explorer
Plugin 'scrooloose/nerdtree'

" Status bar
Plugin 'itchyny/lightline.vim'

" Ack file searcher
Plugin 'mileszs/ack.vim'

" Git
Plugin 'tpope/vim-fugitive.git'

" Super tab
Plugin 'ervandew/supertab'

" Syntax checking
Plugin 'scrooloose/syntastic'

" Fix indentation
Plugin 'tommcdo/vim-lion.git'

" Glutentags ctag autoupdater
Plugin 'ludovicchabant/vim-gutentags'

" Tagbar to view tags in right hand column
Plugin 'majutsushi/tagbar'

call vundle#end() " required
filetype plugin indent on

" Text formatting
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 15
set sw=2
set ts=2
set softtabstop=2
set expandtab
set number
set backspace=2

syntax on
color dracula

" Custom key commands
map <C-p> :CtrlP<CR>
map <C-t> :CtrlPBufTag<CR>
map <F6> :NERDTreeToggle<CR>
map <silent> <c-k> :wincmd k<CR>
map <silent> <c-j> :wincmd j<CR>
map <silent> <c-h> :wincmd h<CR>
map <silent> <c-l> :wincmd l<CR>
map <F8> :TagbarToggle<CR>


" £Indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=235

" Go IDE
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0

" NEO Complete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
"Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
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

" lightbar settings
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ], 
      \             [ 'gutentags' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], 
      \              [ 'percent' ], 
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'gutentags': 'LightLineGutentags'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
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

function! LightLineGutentags()
    return gutentags#statusline("[Generating...]")
endfunction

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_ignore_files = ['\.s$']


augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.go,*.c,*.cpp,*.rb,*.js,*.yaml,*.yml,*.js call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
        call lightline#update()
endfunction

"Exit if quickfix is last window
au BufEnter * call MyLastWindow()
function MyLastWindow()
  " if thje window is quickfix go on
  if $buftype=="quickfix"
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

"Ctrl P settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](git|hg|svn|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_max_files=10000
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

" React settings

