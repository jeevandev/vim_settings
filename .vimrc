execute pathogen#infect()

syntax on
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2|set softtabstop=2|set noexpandtab
autocmd FileType cpp,cc,c set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType python set tabstop=8|set shiftwidth=4|set softtabstop=4|set expandtab
autocmd FileType make setlocal noexpandtab
" Automatically delete all trailing whitespace when we save
autocmd BufWritePre * %s/\s\+$//e

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

set number              " Display Line number
" Toggle line number
:nmap <C-N><C-N> :set invnumber<CR>

set showmatch           " highlight matching [{()}]
set cursorline          " highlight current line

set smartindent
set splitbelow
set splitright

set tags=./tags,tags;

" leader key
let mapleader=","

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" For syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
"let g:neocomplete#enable_at_startup = 1

" Tagbar
nnoremap <leader>tg :TagbarToggle<cr>

nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']    " ignore files in NERDTree

" Override go-to.definition key shortcut to Ctrl-]
" let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope = 1
let g:pymode_folding = 0

" For CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|egg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" For C++/C formating using clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
" autocmd FileType c ClangFormatAutoEnable
" map to <Leader>cf in C++ code
autocmd FileType c,cc,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cc,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
