"https://github.com/skwp/dotfiles/blob/master/vim/vundles.vim
"http://vimawesome.com/
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"
" let Vundle manage Vundle
"  " required!
"
Bundle 'gmarik/vundle'

if has('gui_running')
  " Frameworks and languages
  Bundle 'othree/html5.vim'
  Bundle 'thoughtbot/vim-rspec'

  Bundle 'tpope/vim-rails.git'
  " vim-rails
  command! Ec Econtroller
  command! Ev Eview

  Bundle 'tpope/vim-cucumber'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-ragtag'
  Bundle 'vim-scripts/ruby-matchit'
  Bundle 'vim-ruby/vim-ruby'
  "Bundle 'scrooloose/syntastic'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-bundler'
  Bundle 'tpope/vim-rbenv'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'briancollins/vim-jst'
  Bundle 'ap/vim-css-color'
  Bundle 'austintaylor/vim-choosecolor'
  " provides support for expanding abbreviations
  Bundle 'mattn/emmet-vim'
  " Ctrl-x, will expand emmet fast typing
  let g:user_emmet_leader_key='<C-x>'

  Bundle 'elzr/vim-json'
  Bundle 'evanmiller/nginx-vim-syntax'
  Bundle 'lukaszb/vim-web-indent'
  Bundle 'garbas/vim-snipmate'
  Bundle 'honza/vim-snippets'
  Bundle 'tomtom/tlib_vim'
  Bundle 'vim-scripts/vim-addon-mw-utils'

  " Searching
  Bundle 'ctrlpvim/ctrlp.vim'

  " http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesn't-work-to-ignore-some-folders
  let g:ctrlp_cmd = 'CtrlPMixed'
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

  Bundle 'rking/ag.vim'

  Bundle 'skwp/greplace.vim'
  set grepprg=ag
  let g:grep_cmd_opts = '--line-numbers --noheading'

  "Bundle 'qstrahl/vim-matchmaker'
  Bundle 'vim-scripts/gitignore'
  set wildignore+=*/spec/reports/**

  " Project structure
  Bundle 'scrooloose/nerdtree.git'
  map <Leader>n <plug>NERDTreeTabsToggle<CR>
  nmap <tab><tab> :NERDTreeFind<CR>
  let g:NERDTreeChDirMode=2 "update CWD when changing nerdtree directories
  let NERDTreeShowBookmarks=1

  " VCS
  Bundle 'airblade/vim-gitgutter'
  Bundle 'tpope/vim-fugitive.git'
  Bundle 'mattn/webapi-vim'
  Bundle 'mattn/gist-vim'

  "Vim environment
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'chrisbra/BufTimer'
  let g:buf_report_autosave_dir="/Users/katzmopolitan/buftime"
  let g:buf_report_autosave_periodic=10
  Bundle 'Valloric/YouCompleteMe'
endif

" Vim environment
Bundle 'waylan/vim-markdown-extra-preview'
Bundle 'nelstrom/vim-markdown-preview'
Bundle 'Yggdroot/indentLine'

Bundle 'xolox/vim-misc'
Bundle 'thinca/vim-fontzoom'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Bundle 'bogado/file-line'
Bundle 'chip/vim-fat-finger'
Bundle 'jiangmiao/auto-pairs'

if has('gui_running')
  augroup filetypedetect
    au BufNewFile,BufRead *.jst.eco    set filetype=jst.html
    au BufRead,BufNewFile *nginx*      set ft=nginx
    " http://stackoverflow.com/questions/8671046/vim-folding-syntax-for-scss
    au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
    au BufRead,BufNewFile *.js setlocal foldmethod=marker foldmarker={,}
  augroup END
endif

au BufWritePre * :silent call StripTrailingWhitespace()

"""""" Buffers """"""""""""""""""""""""""""""""""""""""""""""""""""
map <D-]> :bnext<Return>
map <D-[> :bprev<Return>

Bundle 'corntrace/bufexplorer'
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
if has('gui_running')
  autocmd FileType sass,scss,stylus syn cluster sassCssAttributes add=@cssColors

  " update various search commands to be able to search through the gem files
  " :autocmd BufEnter * call SetCurrentGemHome()

  function! SetCurrentGemHome()
    "echom "in SetCurrentGemHome"
    call UpdateGemPath()
    call UpdateSearchCommands()
  endfunction

  function! UpdateSearchCommands()
    :command! -nargs=* AgGems execute 'Ag!' --smart-case <q-args> $GEM_PATH
    map <c-g> :CtrlP $GEM_PATH
  endfunction

  function! UpdateGemPath()
    let $GEM_PREFIX=system("rbenv prefix")
    let $GEMSET_FILE_NAME=system("rbenv gemset file")
    let $GEMSET_NAME=system("cat " . $GEMSET_FILE_NAME)
    let $GEM_PATH=join([$GEM_PREFIX, "gemsets",$GEMSET_NAME],"/")
    let $GEM_PATH = substitute($GEM_PATH,"[\n|\r]*","","g")
  endfunction

endif

"Borrowed from https://github.com/jcmuller/myvimconfig
func! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e          " Remove trailing white space
  %s/\n\{3,}/\r\r/e    " Condense multiple empty lines into one
  " %s#\($\n\s*\)\+\%$## " Only one newline char at EOF
  call cursor(l, c)
endf

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
" ag
let g:agprg="ag --column --smart-case"
cabbrev Ag Ag!

" greplace
let g:grep_cmd_command = 'Ag! --line-numbers --noheading'

" easymotion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" ctrlp
let g:ctrlp_max_files = 0 " no maximum

" indentLine
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = "|"

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
if has('gui_running')
  set cursorline "Highlight the current line"
endif
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

vnoremap > >gv
vnoremap = =gv
"gv reselects the previous selection"

set noerrorbells                  " no beeping please

"set backup                        " save backups
"set backupdir=$HOME/.vim/tmp      " keep backup files in one location
set noswapfile                    " don't use swp files

" custom syntax highlighting
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,bluepill.pill,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

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

  if has('gui_running')
    set statusline+=%{fugitive#statusline()} "  Git Hotness
  endif

  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%#warningmsg#
  "set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Rspec.vim mappings
noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>

" macvim doesn't source profile files
let $PATH=$PATH . ':/usr/local/bin'

" http://ncona.com/2013/01/configuring-vim/
" unindent a line
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" http://stackoverflow.com/questions/442302/tabbing-visual-selection-in-vim
vmap <Tab> >gv
vmap <S-Tab> <gv

" Show tabs and trailing spaces "
set list listchars=tab:→\ ,trail:·

""""""bubbling lines up and down """""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" bubble lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"""""""Convert snake case to camel case """""""""""""""""""""
" http://vim.wikia.com/wiki/Converting_variables_to_or_from_camel_case
nnoremap _ f_x~

" http://amix.dk/vim/vimrc.html
if has("mac") || has("macunix")
  nmap <D-j> <C-j>
  nmap <D-k> <C-k>
  vmap <D-j> <C-j>
  vmap <D-k> <C-k>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

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

" Folding
if has('gui_running')
  " Space to toggle folds.
  nnoremap <Space> za

  " http://vi-improved.org/vimrc.html
  set foldlevel=100 " Don't autofold anything (but I can still fold manually)

  "https://github.com/sjl/dotfiles/blob/eea18b00b8c74943f5094fddf91d3c2a7e0a7242/vim/vimrc#L534
  augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
  augroup END
endif

" Convert buffers to html
let g:html_number_lines = 1

" https://github.com/rudylee/dotfiles/blob/master/vimrc
" Highlight the code when it's more than 80 characters
if has('gui_running')
  augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#d6dfe6
    autocmd BufEnter * match OverLength /\%81v.\+/
  augroup END
endif

filetype plugin indent on    " required
