@echo off

REM Gorev gorunumu dugmesini gizlemek
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f

REM Arama cubugunu gizlemek
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

REM Windows Gezgini'ni yeniden baslatmak icin
taskkill /f /im explorer.exe
start explorer.exe

echo Tum degisiklikler uygulandi.
pause
