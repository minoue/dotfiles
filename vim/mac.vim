let g:previm_open_cmd = 'open -a firefox'
let g:ycm_global_ycm_extra_conf = '/Users/minoue/.vim/pack/myPackage/start/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let $PYTHONPATH = $PYTHONPATH . ':/Applications/Autodesk/maya2019/devkit/other/pymel/extras/completion/py'

" ######## ALE ##########
let g:ale_cpp_clang_options = '
    \ -W
    \ -Wall
    \ -Wextra
    \ -Wconversion
    \ -Wsign
    \ -pedantic
    \ -I
    \ -I/Applications/Autodesk/maya2019/include
    \ -IC:/include
    \ -fsyntax-only
    \ -DREQUIRE_IOSTREAM
    \ -D_BOOL
    \ -DNT_PLUGIN'
