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
Bundle 'mileszs/ack.vim.git'
Bundle 'mscrooloose/nerdtree.git'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'airblade/vim-gitgutter'
Bundle 'skwp/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'

"Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'

"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'ujihisa/neco-ruby'

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
"set noswapfile                    " don't use swp files

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
" https://github.com/r00k/dotfiles/blob/master/vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("! rspec")
      xec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

"map <Leader>t :w<cr>:call RunCurrentTest()<CR>
"map <Leader>cc :!cucumber --drb %<CR>
"map <Leader>bb :!bundle install<cr>

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
"map  <C-]> :tabn<CR> "next tab
"map  <C-[> :tabp<CR> "previous tab

"""""""""""""" Colors """"""""""""""""""
if has('gui_running')
  syntax enable
  set background=light
  colorscheme solarized
endif


let g:neocomplcache_enable_at_startup = 1
