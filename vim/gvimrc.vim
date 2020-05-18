if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " Mac
        set guifont=MonacoForPowerline:h12
        set guifontwide=MonacoForPowerline:h12
    else
        "Linux
        set guifont=Fixed\ 14
        set guifontwide=Fixed\ 14
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
set background=light
" colorscheme vim-monokai-tasty
autocmd ColorScheme * highlight Normal ctermbg=1 guibg=#f5f5f5
colorscheme delek

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
