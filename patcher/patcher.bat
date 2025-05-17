@echo off
setlocal 

set "emudll32=%~dp0\steam_api.dll"
set "emudll64=%~dp0\steam_api64.dll"
set "target=%~dp1"

if exist "%target%\steam_api.dll" goto:32
echo "Error: no steam_api.dll found!"
if exist "%target%\steam_api64.dll" goto:64
echo "Error: no steam_api64.dll found!"
endlocal
pause
exit

:32
if exist "%target%\steam_api_o.dll" goto:32o
ren "%target%\steam_api.dll" steam_api_o.dll
copy /Y "%emudll32%" "%target%\steam_api.dll"
if exist "%target%\steam_api64.dll" goto:64
endlocal
exit

:64
if exist "%target%\steam_api64_o.dll" goto:64o
ren "%target%\steam_api64.dll" steam_api64_o.dll
copy /Y "%emudll64%" "%target%\steam_api64.dll"
if exist "%target%\steam_api.dll" goto:32
endlocal
exit

:32o
echo "Warning: steam_api_o.dll found!"
pause
endlocal
exit

:64o
echo "Warning: steam_api64_o.dll found!"
pause
endlocal
exit