" ######## vim_clang ##########
let g:clang_cpp_options = '
  \ -isystem"C:\Program Files\Autodesk\Maya2018\include"
  \ -I.
  \ -I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.16299.0\ucrt"
  \ -I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.16299.0\shared"
  \ -I"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.12.25827\include"
  \ -fsyntax-only
  \ -DREQUIRE_IOSTREAM
  \ -D_BOOL
  \ -DNT_PLUGIN'

" ######## ALE ##########
let g:ale_cpp_clang_options = '
    \ -W
    \ -Wall
    \ -isystem"C:/Program Files/Autodesk/Maya2018/include"
    \ -I.
    \ -I"C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.12.25827/include"
    \ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/shared"
    \ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/ucrt"
    \ -fsyntax-only
    \ -DREQUIRE_IOSTREAM
    \ -D_BOOL
    \ -DNT_PLUGIN'

" let g:previm_open_cmd = ''
