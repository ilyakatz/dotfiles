function! FontChangeOnResize()
  if &columns > 80
    set guifont=Monospace\ 12
  else
    set guifont=Monospace\ 10
  endif
endfunction
autocmd VimResized * call FontChangeOnResize()

set guifont=Monospace\ 12
