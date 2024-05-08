cd /d %~dp0

mklink C:%HOMEPATH%\AppData\Local\nvim\init.vim %CD%\init.vim
mklink C:%HOMEPATH%\AppData\Local\nvim\ginit.vim %CD%\ginit.vim
mklink C:%HOMEPATH%\AppData\Local\nvim\win.vim %CD%\win.vim

pause
REM exit 0
