if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " Mac
        set guifont=Cica:h18
        set guifontwide=Cica:h18
    else
        "Linux
        set guifont=Cica\ 12
        set guifontwide=Cica\ 12
    endif
elseif has("win32")
    " Windows
    set guifont=Cica:h12
    set guifontwide=Cica:h12
endif

set antialias
set guioptions-=e                   " Text-based tabline in GVIM
set guioptions-=T                   " Remove Toolbar
set guioptions+=c
set vb t_vb=

" Colorscheme
set background=dark
colorscheme vim-monokai-tasty

" Save/load window size
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END
if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif
