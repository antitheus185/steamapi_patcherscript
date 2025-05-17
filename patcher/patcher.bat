@echo off
setlocal 

:: Hey all, vee here. And today, I've attempted to write a script to automatically
:: replace a game's steam_api(64).dll file with one from detanup01's gbe_fork. 
:: I've hastily put this together as I also really don't know shit about 
:: batch scripting, so of course it may or may not (almost positive it does) look
:: very shitty and not well written. I apologize. Feel free to do whatever with
:: this. Need to change the locations I've preset to a different folder? Go for it.
:: I'm gonna leave comments like this to detail what each thing does, btw.
:: Have any issues? Contact me on either discord or here on github to let me know.
:: My discord is @veeanti and my github is antitheus185. (Although, you should already
:: be on my repository for this, so just make an Issue or DM me.)
:: ~veeanti<3

:: As you can see here, I've set the source files for the emu dlls
:: to be located in your Documents folder inside the folder I've made.
set "emudll32=%USERPROFILE%\Documents\patcher\steam_api.dll"
set "emudll64=%USERPROFILE%\Documents\patcher\steam_api64.dll"

:: This sets the target as the directory of the file you right clicked on.
:: Verrrryyyyy important for this to work. 
set "target=%~dp1"

:: Looking in the directory for the steam_api.dll, then sends the script to the :32 part.
if exist "%target%\steam_api.dll" (
	goto 32
)

:: Same thing as the :32 one, but for 64bit .dlls.
if exist "%target%\steam_api64.dll" (
	goto 64
)


:32

:: Renames original steam_api.dll as part of my attempt to prevent a loop with the script.
ren "%target%\steam_api.dll" steam_api_o.dll

:: Force copies from the source folder to the target, that's what the /Y is for.
copy /Y "%emudll32%" "%target%\steam_api.dll" 

:: Ruh-roh, Raggy! No steam_api.dll?! Make sure you're in the directory of the .dll when running it.
if not exist "%target%\steam_api.dll" (
	echo "Error: no steam_api.dll found!"
	endlocal
	pause
	exit
)

if exist "%target%\steam_api64_o.dll" (
	goto 64o
)
:: I've noted a possible issue with this particular part in the :64 section.
if exist "%target%\steam_api64.dll" (
	goto 64
)

:: If you don't have a steam_api64.dll in the directory, it'll end and be done.
if not exist "%target%\steam_api64.dll (
	endlocal
	exit
)

:64
ren "%target%\steam_api64.dll" steam_api64_o.dll
copy /Y "%emudll64%" "%target%\steam_api64.dll"

:: This MAY cause issues with running the :32 sections, not sure yet.
:: (It did for both :64 and :32, so I moved both "if not exist" lines back into
:: their respective sections so at least it'll actually work.)
if not exist "%target%\steam_api64.dll" (
	echo "Error: no steam_api64.dll found!"
	endlocal
	pause
	exit
)

if exist "%target%\steam_api_o.dll" (
	goto 32o
)
:: If you have a game that for one reason or another has both 32bit and 64bit api dlls,
:: this MAY cause a looping issue where it'll keep detecting both files
:: and sending it back through :32 and then back to :64, cycling non-stop.
:: Let's hope that doesn't happen. If it does after I get around to testing it, 
:: I'll just rewrite certain parts of this to counter that.
if exist "%target%\steam_api.dll" (
	goto 32
)
if not exist "%target%\steam_api.dll" (
	endlocal
	exit
)

:32o
echo "Warning: steam_api_o.dll found! File is possibly pre-patched."
pause
endlocal
exit

:64o
echo "Warning: steam_api64_o.dll found! File is possibly pre-patched."
pause
endlocal
exit