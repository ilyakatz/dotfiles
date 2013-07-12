execute pathogen#infect()
syntax on
filetype plugin indent on

"Basic settings"
set nocompatible "Apparently this is a good idea."
syntax on "Syntax Highlighting"
set history=300 "300 lines of history"
set backspace=indent,eol,start "Backspace over autoindent, line breaks, and the start of insert"
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

"Shift-tab reverse-indenting"
nnoremap <S-Tab> <<
inoremap <S-Tab> <Esc><<i
vnoremap <S-Tab> <gv
vnoremap < <gv
"gv reselects the previous selection"

"Delete key no longer deletes in normal mode"
nnoremap <del> <right>


"Mappings"
map <F2> :NERDTree<CR>
