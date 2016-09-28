map <C-t> :GoDecls<CR>
map <C-S-t> :GoDeclsDir<CR>

"let g:gutentags_cache_dir="~/.nvim/tags"

let g:gutentags_project_info = []
call add(g:gutentags_project_info, {"type": "go", "glob": "*.go"})
let g:gutentags_ctags_executable_go = 'gotags -R'

let g:gutentags_exclude=["node_modules","plugged","tmp","temp","log","vendor"]

let g:gutentags_resolve_symlinks = 1

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
