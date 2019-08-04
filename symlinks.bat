cd /d %~dp0

mklink C:%HOMEPATH%\_vimrc %CD%\vim\vimrc.vim
mklink C:%HOMEPATH%\_gvimrc %CD%\vim\gvimrc.vim
mklink C:%HOMEPATH%\windows.vim %CD%\vim\windows.vim
mklink C:%HOMEPATH%\.bashrc %CD%\bash\bashrc
mklink C:%HOMEPATH%\windows.sh %CD%\bash\windows.sh

pause
REM exit 0
