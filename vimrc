set nocompatible 		" set iMproved, required
filetype plugin indent on 	" required
syntax on

"Auto install Plug https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" set rtp+=/usr/local/opt/fzf "Fuzzy finder, installed via homebrew
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree'
Plug 'psf/black'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'overcache/NeoSolarized'
Plug 'jlanzarotta/bufexplorer'

call plug#end()


"" Settings
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
set backspace=indent,eol,start  " delete with backspace key
set lazyredraw
set title
set autoindent
set nowrap                      " No Wrap lines

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
if system('uname') =~ "Darwin"
  set clipboard=unnamed
elseif system("uname") == "Linux"
  set clipboard=unnamedplus
endif"

" Spaces and Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ai                            "Auto indent
set si                            "Smart indent

" Colors and Syntax
set termguicolors
let g:neosolarized_termtrans=1
syntax enable
set background=dark
colorscheme NeoSolarized

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
set cmdheight=1
set laststatus=2
set scrolloff=10

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

" bufexplorer
map ,, ,be


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
let g:indentLine_setConceal = 0
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
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
call deoplete#custom#option('ignore_sources', {'_': ['buffer', 'member', 'tag', 'file', 'neosnippet']})

  " Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])


" ========= vim-better-whitespace ==================
:autocmd FileType md Disablewhitespace

" fzf settings
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>
" fzf Files wit preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
" fzf Rg wit preview
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)



" prettier settings
let g:prettier#autoformat = 0
autocmd BufWritePost *.js,*.css,*.less,*.scss,*.json Prettier

" black formatter settings
let g:black_virtualenv = '~/.local/share/black'
let g:black_fast = 1
"autocmd BufWritePre *.py execute ':Black'
