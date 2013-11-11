"https://github.com/skwp/dotfiles/blob/master/vim/vundles.vim
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required!
"
Bundle 'gmarik/vundle'

" Frameworks and languages
Bundle 'othree/html5.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'
Bundle 'kchmck/vim-coffee-script'
Bundle 'briancollins/vim-jst'
Bundle 'ap/vim-css-color'
Bundle 'austintaylor/vim-choosecolor'
Bundle 'mattn/emmet-vim'
Bundle 'elzr/vim-json'

" Searching
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'vim-scripts/gitignore'
set wildignore+=*/spec/reports/**

" Project structure
Bundle 'scrooloose/nerdtree.git'
Bundle 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <tab> :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2 "update CWD when changing nerdtree directories
let NERDTreeShowBookmarks=1

" VCS
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive.git'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

" Vim environment
Bundle 'altercation/vim-colors-solarized'
Bundle 'waylan/vim-markdown-extra-preview'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'thinca/vim-fontzoom'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-easymotion'

augroup filetypedetect
  au BufNewFile,BufRead *.jst.eco    set filetype=jst.html
augroup END

"""""" Buffers """"""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'corntrace/bufexplorer'
" Bundle 'fholgado/minibufxpl.vim'
" MiniBufExpl Colors
" hi MBENormal               guifg=#F1266F guibg=fg
" hi MBEChanged              guifg=#CD5907 guibg=fg
" hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
" hi MBEVisibleChanged       guifg=#F1266F guibg=fg
" hi MBEVisibleActiveNormal  guifg=#295cdb guibg=fg
" hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" annoying messages, use for debugging only
":mess

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" update various search commands to be able to search through the gem files
:autocmd BufEnter * call SetCurrentGemHome()

function! SetCurrentGemHome()
  "echom "in SetCurrentGemHome"
  call UpdateGemPath()
  call UpdateSearchCommands()
endfunction

function! UpdateSearchCommands()
  :command! -nargs=* AgGems execute 'Ag' <q-args> $GEM_PATH
  map <c-g> :CtrlP $GEM_PATH
endfunction

function! UpdateGemPath()
  let $GEM_PREFIX=system("rbenv prefix")
  let $GEMSET_FILE_NAME=system("rbenv gemset file")
  let $GEMSET_NAME=system("cat " . $GEMSET_FILE_NAME)
  let $GEM_PATH=join([$GEM_PREFIX, "gemsets",$GEMSET_NAME],"/")
  let $GEM_PATH = substitute($GEM_PATH,"[\n|\r]*","","g")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin indent on

"Basic settings"
set nocompatible "Apparently this is a good idea.
syntax on "Syntax Highlighting"
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

""""""" Plugins customization""""""""""""""""""""""""""""""""""
" easymotion
let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ctrlp
let g:ctrlp_max_files = 0 " no maximum

" indentLine
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = "|"

" blclose
"nmap <c-w> :Bclose<cr>
nmap <c-{> :MBEbp<cr>

" vim-session
let g:session_autosave='yes'
let g:session_autoload='prompt'
let g:session_default_overwrite=1
let g:session_default_name="project"
let g:session_default_to_last=1

" vim-rails
command! Ec Econtroller
command! Ev Eview

" gist-vim
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1

""""""" End Plugins customization""""""""""""""""""""""""""""""""""

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
inoremap <Tab> <Esc>>>i
vnoremap <Tab> >gv
vnoremap > >gv
vnoremap = =gv
"gv reselects the previous selection"

set noerrorbells                  " no beeping please

"set backup                        " save backups
"set backupdir=$HOME/.vim/tmp      " keep backup files in one location
set noswapfile                    " don't use swp files


" custom syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,bluepill.pill,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" auto strip whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e

" indent the whole file
map <silent> <F5> mmgg=G'm
imap <silent> <F5> <Esc> mmgg=G'm

" Get rid of the delay when hitting esc!
set noesckeys

command! W w " Bind :W to :w
command! Q q " Bind :Q to :q
command! Qall qall


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>

"To define a mapping which uses the mapleader variable, the special string
"<Leader>" can be used.  It is replaced with the string value of mapleader.
"If mapleader is not set or empty, a backslash is used instead.
"Example:
"    :map <Leader>A  oanother line <Esc>
"Works like:
"    :map \A  oanother line <Esc>



" autosave
:au FocusLost * :wa
:set autowriteall

"""""""""""""" Colors """"""""""""""""""
if has('gui_running')
  syntax enable
  "set background=light
  colorscheme solarized
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=999
  set guifont=Menlo\ Regular:h14 " increase defalt size
endif

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" macvim doesn't source profile files
let $PATH=$PATH . ':/usr/local/bin'

" http://ncona.com/2013/01/configuring-vim/
" unindent a line
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" Show tabs and trailing spaces "
set list listchars=tab:→\ ,trail:·

""""""bubbling lines up and down """""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" bubble lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" http://amix.dk/vim/vimrc.html
if has("mac") || has("macunix")
  nmap <D-j> <C-j>
  nmap <D-k> <C-k>
  vmap <D-j> <C-j>
  vmap <D-k> <C-k>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-fontzoom
"shift-minus to decrease size
nmap _ -

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set vb

let g:ragtag_global_maps = 1

" http://stackoverflow.com/questions/54255/in-vim-is-there-a-way-to-delete-without-putting-text-in-the-register
" Override visually selected text
vmap r "_dP


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup myvimrc
  au!
  if has('gui_running')
    if has("mac")  || has("macunix")
      let $rcfile=$MYVIMRC
    else
      let $rcfile=$MYGVIMRC
    endif
  else
    let $rcfile=$MYVIMRC
  endif
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so  $rcfile
augroup END


"""""" Preview current file in browser with highlighting """"""""""
" :TOhtml
" :!open %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
