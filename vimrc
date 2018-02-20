set nocompatible
filetype on
filetype indent on

" vim-plug settings
filetype plugin on
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" general
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'

" Syntax Checking
"Plug 'w0rp/ale'
"Plug 'vim-syntastic/syntastic'

" visual plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'


" Python plugin
Plug 'ntpeters/vim-better-whitespace'
Plug 'Chiel92/vim-autoformat'
Plug 'nvie/vim-flake8'

" HTML support plugin
Plug 'mattn/emmet-vim'

" Json Plugin
Plug 'elzr/vim-json'

" Puppet Plugin
Plug 'rodjek/vim-puppet'

" Git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" VimWiki
Plug 'vimwiki/vimwiki'

" Calendar
Plug 'mattn/calendar-vim'

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
set lazyredraw

" Python specific
let python_highlight_all=1

" Colors and Syntax
syntax enable
"set t_Co=256
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

" Spaces and Tabs
set tabstop=4
set softtabstop=4
set expandtab

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

" IndentLine
let g:vim_json_syntax_conceal = 0
"let g:indentLine_bgcolor_term = 23
let g:indentLine_color_term = 166

" Autoformat
noremap <F3> :Autoformat<CR>

" airline
let g:airline_theme = 'codedark'
let g:airline_solarized_bg='dark'

" emmet setting
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall      " enable emmet for only html and css

" folding settings
set nofoldenable

" Movement
nnoremap j gj
nnoremap k gk

" Vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/Vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
