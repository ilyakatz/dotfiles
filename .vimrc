"installation
" ~/.vim/bundle
"cd ~/.vim/bundle
"git clone https://github.com/scrooloose/nerdtree.git
"git clone git://github.com/tpope/vim-bundler.git
"git clone git://github.com/tpope/vim-fugitive.git
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"git clone git://github.com/tpope/vim-rails.git
"git clone git://github.com/tpope/vim-sensible.git

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required!
Bundle 'gmarik/vundle'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-rails.git'
command! Ec Econtroller
command! Ev Eview
Bundle 'mileszs/ack.vim.git'
Bundle 'mscrooloose/nerdtree.git'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'airblade/vim-gitgutter'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'waylan/vim-markdown-extra-preview'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'

"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'ujihisa/neco-ruby'

Bundle 'tpope/vim-rbenv'

:autocmd BufEnter * call SetCurrentGemHome()

"Displays the recent mess
:mess

function! SetCurrentGemHome()
  let $RAILS_PATH = system('bundle show rails')
  let $GEM_HOME= fnamemodify($RAILS_PATH, ":p:h")
  :command! -nargs=* AckGem execute 'Ack' <q-args> $GEM_HOME
endfunction

execute pathogen#infect()
syntax on
filetype plugin indent on

"Basic settings"
set nocompatible "Apparently this is a good idea.
syntax on "Syntax Highlighting"
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set history=300 "300 lines of history
set backspace=indent,eol,start "Backspace over autoindent, line breaks, and the start of insert
set ruler "Show the ruler"
set virtualedit=onemore "Allows cursor placement over the line's end in normal mode"
set pastetoggle=<F2> "F2 enters paste mode in Insert mode"
set clipboard=unnamed "OS-level clipboard integration for yank and put"
set number "Show line numbers"
filetype plugin indent on "Automatic indentation based on filetype"
let &t_Co=256 "256 colors in the terminal"
set cursorline "Highlight the current line"
set mouse=a "Mouse support"
Helptags
set hidden "Allow switching from unsaved buffers"
set confirm "Confirmation dialog instead of fail on unwritten buffers"

"Search"
set hlsearch "Highlights search results"
set ignorecase "Case-insensitive search"
set smartcase "If a search contains an uppercase character, it is case-sensitive"
set incsearch "Incremental search: search as you type"

"Make Y behave like other capitals"
nnoremap Y y$

"Better split movement"
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
inoremap <c-h> <Esc><c-w>h
inoremap <c-l> <Esc><c-w>l
inoremap <c-j> <Esc><c-w>j
inoremap <c-k> <Esc><c-w>k

"Better wrapped line navigation"
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
vnoremap <down> gj
vnoremap <up> gk

"Indentation - please ignore how terrible this may be"
set autoindent
set smartindent "conflicts with filetype plugin indent on"
set smarttab "Tab key does indents"
"set tabstop=4
set shiftwidth=2
set expandtab

"Tab always indents"
nnoremap <Tab> >>
inoremap <Tab> <Esc>>>i
vnoremap <Tab> >gv
vnoremap > >gv
vnoremap = =gv
"gv reselects the previous selection"

"Shift-tab reverse-indenting" nnoremap <S-Tab> << inoremap <S-Tab> <Esc><<i vnoremap <S-Tab> <gv vnoremap < <gv "gv reselects the previous selection"

"Delete key no longer deletes in normal mode"
nnoremap <del> <right>

set noerrorbells                  " no beeping please

"set backup                        " save backups
"set backupdir=$HOME/.vim/tmp      " keep backup files in one location
set noswapfile                    " don't use swp files

" gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

" custom syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,bluepill.pill,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" auto strip whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" indent the whole file
map <silent> <F5> mmgg=G'm
imap <silent> <F5> <Esc> mmgg=G'm

" Get rid of the delay when hitting esc!
set noesckeys

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

command! W w " Bind :W to :w
command! Q q " Bind :Q to :q
command! Qall qall

"" Git
map <Leader>gs :Gstatus<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>

"To define a mapping which uses the mapleader variable, the special string
"<Leader>" can be used.  It is replaced with the string value of mapleader.
"If mapleader is not set or empty, a backslash is used instead.
"Example:
"    :map <Leader>A  oanother line <Esc>
"Works like:
"    :map \A  oanother line <Esc>


""""""""""""""" File navigation"""""""""""""""
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <F2> :NERDTree<CR>
let NERDTreeShowBookmarks=1

" autosave
:au FocusLost * :wa
:set autowriteall


let g:NERDTreeChDirMode=2 "update CWD when changing nerdtree directories
"map  <C-]> :tabn<CR> "next tab
"map  <C-[> :tabp<CR> "previous tab

"""""""""""""" Colors """"""""""""""""""
if has('gui_running')
  syntax enable
  set background=light
  colorscheme solarized
endif

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  "  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

Bundle 'ap/vim-css-color'

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" macvim doesn't source profile files
let $PATH=$PATH . ':/usr/local/bin'

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=100
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif
