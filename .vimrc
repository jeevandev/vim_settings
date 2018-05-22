execute pathogen#infect()

syntax on
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2|set softtabstop=2|set noexpandtab
autocmd FileType cpp,cc,c set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType python set tabstop=8|set shiftwidth=4|set softtabstop=4|set expandtab
autocmd FileType javascript set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
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

"set tags=./tags,tags;

" leader key
let mapleader=","

" Searching {
set ignorecase " case insensitive matching...
set smartcase  " ...but only if the user didn't explicate case.
set hlsearch   " highlight matches
" NOTE: highligting doesn't have to be disabled to be temporarily hidden:
" - you can run `:nohlsearch` to turn it off until the next search
" - vim-sensible extends <Ctrl>-l so that it runs `:nohlsearch`
" - furthermore, the following automatically turns off highlighting when in
"   insert mode

augroup hlsearch
	autocmd InsertEnter * :setlocal nohlsearch " Disable hlsearch in insert  mode...
	autocmd InsertLeave * :setlocal   hlsearch " ...enable it when we come out.
augroup END
" }

" Save with <leader>-s
noremap <leader>s :w<CR>
inoremap <leader>s <C-o>:w<CR>

" autocompletion {
" default autocompletion
set completeopt=longest,menuone,preview,noinsert
" Enter key behaves correctly when popup menu is visible
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Saner preview window color selection
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
highlight Pmenu ctermfg=6 ctermbg=238
highlight PmenuSel ctermfg=5 ctermbg=0
" }

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" For syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:neocomplete#enable_at_startup = 1
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Tagbar
nnoremap <leader>tg :TagbarToggle<cr>

" vimgrepper
nnoremap <leader>g :Grepper -tool git grep<CR>

nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']    " ignore files in NERDTree

" let pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_options_max_line_length=120
let g:pymode_folding = 0
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
" let g:pymode_rope_autoimport_bind = '<leader>eb'
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_autoimport = 0

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

" Shortcut to edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" golang specific
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled = 0

autocmd FileType go nnoremap <buffer> <silent> <C-]> :GoDef<CR>
autocmd FileType go nnoremap <buffer> <silent> <C-t> :<C-U>call go#def#StackPop(v:count1)<CR>

" Automagically run goimports on save
let g:go_fmt_command = "goimports"

" Run lint and vet on save
let g:go_metalinter_autosave = 0  "autosave metalinter does not work due to fugitive buffers
au FileType go nmap <leader>lg :GoLint<CR>
au FileType go nmap <leader>tg :GoVet<CR>

" Format Json
nmap =j :%!python -m json.tool<CR>gg=G<CR>

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)<CR>

" Python Specific
" Change vertical column color to gray
hi ColorColumn ctermbg=8

colorscheme molokai " pick molokai as color scheme
set diffopt=vertical " opens diff in vertical splits

" Folding {
" set foldmethod=indent " default to indent folding
" set foldlevelstart=1  " with one level open

" syntax folding for some filetypes {
" augroup syntax_folding
" autocmd FileType markdown setlocal foldmethod=syntax
" autocmd FileType json setlocal foldmethod=syntax
" augroup END
" }

" }
