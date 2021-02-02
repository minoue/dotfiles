" ######## ALE ##########
let g:ale_cpp_clangd_options = '
  \ -W
  \ -Wall
  \ -Wextra
  \ -Wconversion
  \ -Wsign
  \ -pedantic
  \ -isystem"E:/Program Files/Autodesk/Maya2020/include"
  \ -I"E:/Program Files (x86)/Microsoft Visual Studio/2019/BuildTools/VC/Tools/MSVC/14.27.29110/include"
  \ -fsyntax-only
  \ -DREQUIRE_IOSTREAM
  \ -D_BOOL
  \ -DNT_PLUGIN'

"\ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/shared"
"\ -I"C:/Program Files (x86)/Windows Kits/10/Include/10.0.16299.0/ucrt"

let g:previm_open_cmd = 'C:/Program\ Files/Vivaldi/Application/vivaldi.exe'
let $PYTHONPATH = $PYTHONPATH . ';E:\completion\py'
let g:ycm_global_ycm_extra_conf = $HOME . '/vimfiles/pack/plugins/start/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
set rop=type:directx

function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
                \ 'LANG': systemlist('"E:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_startでgit for windowsのbashを実行する
    call term_start(['E:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_name': 'Git',
                \ 'term_finish': 'close',
                \ 'curwin': v:true,
                \ 'cwd': $USERPROFILE,
                \ 'env': l:env,
                \ })
endfunction
