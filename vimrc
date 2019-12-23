load plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible 		" set iMproved, required
filetype plugin indent on 	" required
syntax on

"" Settings
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
set backspace=indent,eol,start  " delete with backspace key
set lazyredraw

" leader key mapping
let mapleader = ","
let g:mapleader = ","

" dont use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just dont
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" copy and paste to/from Vim and the clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+P
vnoremap <C-p> "+P

" access system clipboard
set clipboard=unnamedplus

" Spaces and Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" show line-length
if (exists('+colorcolumn'))
      set colorcolumn=88
      highlight ColorColumn ctermbg=9
endif

" Colors and Syntax
syntax enable
if has('gui_running')
  set background=light
  colorscheme solarized
else
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
set background=dark
colorscheme solarized
endif

" File type settins
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab textwidth=79 autoindent fileformat=unix
autocmd BufNewFile,BufRead *.template setfiletype=json              "set template file type as json

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

" list setting
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
" tab
map <C-S-]> gt
map <C-S-[> gT

" buffer
set hidden                      " don't complain when buffer is modified
nnoremap <leader>r :bnext<CR>   " loop through buffer

"NerdTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd BufEnter NERD_tree* :LeadingSpaceDisable " work around with indent issue
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " toggle nerdtree window

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
"let g:indentLine_setConceal = 0
let g:indentLine_color_term = 94
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '⋅'
let g:indentLine_concealcursor = 'nv'

" airline
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
:autocmd FileType md Disablewhitespace

" fzf settings
set rtp+=~/.fzf
nnoremap <leader>t :Files<CR>

" prettier settings
let g:prettier#autoformat = 0
autocmd BufWritePost *.js,*.css,*.less,*.scss Prettier

" black formatter settings
let g:black_virtualenv = '~/.local/share/black'
let g:black_fast = 1
"autocmd BufWritePre *.py execute ':Black'
