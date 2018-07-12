" load plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible 		" set iMproved, required
filetype off

filetype plugin indent on 	" required

"" Settings
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
set backspace=indent,eol,start  " delete with backspace key
set lazyredraw

" Spaces and Tabs
set tabstop=4
set softtabstop=4
set expandtab

" Colors and Syntax
syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
set background=dark
colorscheme solarized

" File type settins
au BufNewFile,BufRead *.py                                      " Python PEP8 indentation
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
au BufNewFile,BufRead *.template set filetype=json              "set template file type as json
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.html,*.css setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.yaml,*.yml setlocal expandtab ts=2 sw=2

" Number settings
set number

" UI Config
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set cursorline
set ruler                       " Show the cursor position all the time
set wildmenu wildmode=list:full
set wildignore+=*.pyc           " ignore python byte code
set showmatch
set nowrap                      " no line wrap at the end

" Window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows

" Searching
set path+=**
set noshowmatch
set noshowmode
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>

" Disable .netrwhist file
let g:netrw_dirhistmax=0

" IndentLine
let g:vim_json_syntax_conceal = 0
let g:indentLine_bgcolor_term = 23
let g:indentLine_color_term = 166

" airline
let g:airline_theme = 'solarized'

" folding settings
set nofoldenable

" Movement
nnoremap j gj
nnoremap k gk

" enable mouse
if has('mouse')
  set mouse=a
endif
set ttymouse=xterm


" ==================== Completion =========================
" use deoplete for vim.
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

  " Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])


" ========= vim-better-whitespace ==================
:autocmd FileType markdown EnableWhitespace
