"==============================
" Package Management via Vundle
"==============================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Git wrapper (required for airline to retrieve git information)
Plugin 'tpope/vim-fugitive'

" Lean & mean status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_symbols_ascii = 1
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0

" Efficient, simple python folding
Plugin 'tmhedberg/SimpylFold'
" let g:SimpylFold_docstring_preview = 0
nnoremap f za

" Syntax checking
Plugin 'vim-syntastic/syntastic.git'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"========================
" Additional Vim settings
"========================
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
" It is easier to reach than the default leader key (i.e. backslash) and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Quickly exit insert mode
inoremap jj <Esc>

" Quick save command
noremap <Leader>s :update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :quit!<CR> " Force quit current window

" Easy movement between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Easy movement between tabs
map <Leader>t <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Easy movement of code blocks
" (i.e. go into visual mode (v),
" then select several lines of code, and
" then press ``>`` several times).
vnoremap < <gv
vnoremap > >gv

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Showing line numbers and length
set number " show line numbers
set ruler  " show cursor line number (and %) and column number
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
if exists("&colorcolumn")
    set colorcolumn=80
endif
highlight ColorColumn ctermbg=233

" Show whitespace
" (MUST be inserted BEFORE the colorscheme command)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Color scheme
let g:solarized_termcolors=256
let g:solarized_italic=0
let g:airline_theme = 'solarized'

if has('gui_running')
    set background=light
else
    set background=dark
    let g:airline_solarized_bg = 'dark'
endif

colorscheme solarized

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" History settings
set history=1000
set undolevels=1000

" Spell checking
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell

" To enable pasting
set clipboard=unnamed

" Redraw to eliminate any artifacts from startup buffer(s)
autocmd VimEnter * :redraw!
