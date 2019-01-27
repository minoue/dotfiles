cd /d %~dp0

mklink %HOMEPATH%"\_vimrc" %CD%"\vim\vimrc.vim"
mklink %HOMEPATH%"\_gvimrc" %CD%"\vim\gvimrc.vim"
mklink %HOMEPATH%"\windows.vim" %CD%"\vim\windows.vim"

pause
REM exit 0
