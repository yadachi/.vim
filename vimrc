set nocompatible
filetype on

" vim-plug settings
filetype plugin on
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" general
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Syntax Checking
Plug 'w0rp/ale'

" visual plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'

" Auto complete
Plug 'Valloric/YouCompleteMe'

" fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Python plugin
Plug 'ntpeters/vim-better-whitespace'
Plug 'Chiel92/vim-autoformat'
"Plug 'python-mode/python-mode'

" Json Plugin
Plug 'elzr/vim-json'

" Puppet Plugin
Plug 'rodjek/vim-puppet'

" Git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"PlugInstall [name ...] [#threads] 	Install plugins
"PlugUpdate [name ...] [#threads] 	Install or update plugins
"PlugClean[!] 	                    Remove unused directories (bang version will clean without prompt)
"PlugUpgrade 	                    Upgrade vim-plug itself
"PlugStatus 	                    Check the status of plugins
"PlugDiff 	                        Examine changes from the previous update and the pending changes
"PlugSnapshot[!] [output path] 	    Generate script for restoring the current snapshot of the plugins
call plug#end()

"" Settings
set noerrorbells                " No beeps
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
set backspace=indent,eol,start  " delete with backspace key

" Colors and Syntax
set t_Co=256
syntax enable
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
set background=dark
colorscheme solarized

" File type settins
au BufNewFile,BufRead *.template set filetype=json              "set template file type as json
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

" Spaces and Tabs
set tabstop=4
set softtabstop=4
set expandtab

" UI Config
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set cursorline
set ruler                       " Show the cursor position all the time
set wildmenu wildmode=list:full
set wildignore+=*.pyc           " ignore python byte code
set showmatch
set nowrap                      " no line wrap at the end

" WIndow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows

" Browsing
map <C-e> :NERDTreeToggle<CR>   " Open Nerdtree"

" Searching
set path+=**
set noshowmatch
set noshowmode
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>

" Ctrlp settings
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 10

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

 " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"=================== airline =======================
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" folding settings come later

" Movement
nnoremap j gj
nnoremap k gk
