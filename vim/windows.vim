" ######## ALE ##########
let g:ale_cpp_clang_options = '
    \ -W
    \ -Wall
    \ -Wextra
    \ -Wconversion
    \ -Wsign
    \ -pedantic
    \ -isystem"C:/Program Files/Autodesk/Maya2018/include"
    \ -I
    \ -I"C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.12.25827/include"
    \ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/shared"
    \ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/ucrt"
    \ -IC:/include
    \ -fsyntax-only
    \ -DREQUIRE_IOSTREAM
    \ -D_BOOL
    \ -DNT_PLUGIN'

" let g:previm_open_cmd = 'C:/Program\ Files/Mozilla\ Firefox/firefox.exe'
let g:previm_open_cmd = 'C:/Users/Michitaka/AppData/Local/Vivaldi/Application/vivaldi.exe'

let $PYTHONPATH = $PYTHONPATH . ';C:/Program Files/Autodesk/Maya2017/devkit/other/pymel/extras/completion/py'

let g:ycm_global_ycm_extra_conf = 'C:\Users\Michitaka\vimfiles\pack\myPackage\start\YouCompleteMe\third_party\ycmd\.ycm_extra_conf.py'

function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
                \ 'LANG': systemlist('"C:/Program Files (x86)/Git/usr/bin/locale.exe" -iU')[0],
                \ }
    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif
    " term_startでgit for windowsのbashを実行する
    call term_start(['C:/Program Files (x86)/Git/bin/bash.exe', '-l'], {
                \ 'term_name': 'Git',
                \ 'term_finish': 'close',
                \ 'curwin': v:true,
                \ 'cwd': getcwd(),
                \ 'env': l:env,
                \ })
endfunction
