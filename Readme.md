**bold** indicates insert mode

### Ruby/Rails

`:Ev` corresponding view

`:Ec` corresponding controller

`\t`  - run test

`:A` - show alternate file (test/implementation)

`<c-g>` - open files in gem directory

### Code

`\cc` - comment out line

`\ci` - toggle commented lines

`vat` - select all text with the curret indentation

`<C-x>,` - emmet expension

`_` - convert next occurrence of `_` in snake_case to CamelCase

### Github
`:Gist` create public gist

`:Gist -p` create private gist

`:Gbrowse` - show link to gitub

`:.Gbrowse` - show link in github with line number

### Markdown

`:Mm` show preview of markdown

### Buffers
`:b [buff name]` will open buffer with that (part-)name or buffer number

`<c-w>` close buffer

### vim general

`:set wildignore`

`:promptrepl`  open MacVim serach promt

`:help [name]` show helptags

`b` go to beginning of current word

`cntrl-v` select columns

`[num]V` select _num_ lines

`:TOhtml` create HTML repsentation from the current file (with formatting)

`:!open %` open current file in browser

### Navigation

`J` move line down

`K` move line up

`*` search of current text in the file

`:ChooseColor` open colorpicker

`\\w` activate easy motion

`\\f{char}` activate easy motion for a given {char}

`:Ag! "stuff"` search for "stuff"

`:Ag!` - seach for word under cursor

`AgHelp!`  search through vim helptags

`<C-]>` go into the definition of class/module/etc under the cursor

`<C-t>` go back to where came from

`\be` - open buffer explorer window

`:`  repeat the last command

`:[command] [up-key]` - search for [command]

`:Gsearch [term]` search through the files for term so that it can later be replaced with `:Greplace`

`:Tagbar` - shows/hide the structure of a file based on ctags

### Multi-cursors

`<c-n>` select word under cursor, press again to sent the next one, and do regular changes to update all selections

#### vim-ragtag

**`<C-X>-`        <% %>**

**`<C-X>=`        foo<%= ^ %>**

**`tag<C-X>Enter` <tag></tag>**

**`<C-X>/`        closes the last open tag**

#### cntrlp
`F5` refresh

#### surround

S{ - surround with { -(visual mode)
ds{ - delete surrounding {

### NERDTree

`m` go to the parent directory

`C` - change the root directory to current directory

`s ` - open in split windows

`Ctrl-W r ` - move window to the right
