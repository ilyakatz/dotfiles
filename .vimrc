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
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'vim-ruby/vim-ruby'
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

Bundle 'vim-scripts/AutoComplPop'
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = "|"

Bundle 'fholgado/minibufexpl.vim'
" MiniBufExpl Colors
hi MBENormal               guifg=#F1266F guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#295cdb guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" annoying messages, use for debugging only
:mess

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" update ack command to be able to search through the gem files
:autocmd BufEnter * call SetCurrentGemHome()
function! SetCurrentGemHome()
    call UpdateGemPath()
    :command! -nargs=* AckGems execute 'Ack' <q-args> $GEM_PATH
endfunction

function! UpdateGemPath()
  let $GEM_PREFIX=system("rbenv prefix")
  let $GEMSET_FILE_NAME=system("rbenv gemset file")
  let $GEMSET_NAME=system("cat " . $GEMSET_FILE_NAME)
  let $GEM_PATH=join([$GEM_PREFIX, "gemsets",$GEMSET_NAME],"/")
  let $GEM_PATH = substitute($GEM_PATH,"[\n|\r]*","","g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

set autoindent
set copyindent
set smartindent "conflicts with filetype plugin indent on"
set smarttab "Tab key does indents"
set shiftwidth=2
set expandtab

"Tab always indents"
nnoremap <Tab> >>
inoremap <Tab> <Esc>>>i
vnoremap <Tab> >gv
vnoremap > >gv
vnoremap = =gv
"gv reselects the previous selection"

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
let g:NERDTreeChDirMode=2 "update CWD when changing nerdtree directories
let NERDTreeShowBookmarks=1

" autosave
:au FocusLost * :wa
:set autowriteall


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

  set guifont=Menlo\ Regular:h14 " increase defalt size
endif

" http://ncona.com/2013/01/configuring-vim/
" unindent a line
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" Highlight column 81 to help keep lines of code 80 characters or less "
set colorcolumn=81
" Show tabs and trailing spaces "
"
 set list listchars=tab:→\ ,trail:·

"http://intermediaware.com/blog/how-i-learned-to-love-vim-in-7-days
" Bubble single line
nmap K ddkP
nmap J ddp
" Bubble multiple lines
vmap K ddkP
vmap J xp`[V`]

Bundle 'thinca/vim-fontzoom'
"shift-minus to decrease size
nmap _ -

"disable annoying error bells
set noerrorbells t_vb=

let g:ragtag_global_maps = 1

" comment for the future
" xolox/vim-session
