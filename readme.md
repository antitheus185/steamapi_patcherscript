Use filetypesman to add the batch script to the .dll extension so you can use it in your context menu (right-click menu).

- Open FileTypesMan and scroll down until you find ".dll" (it may take a while of scrolling depends on how long your list comes out to be)
- Click on it, then right click on the bottom section of the window.
- Click on "New Action"
- Set the action name to whatever you want, it does not affect what comes up in your right-click menu.
- Set the menu caption to something along the lines of "Patch steam_api(64).dll", of course, you don't actually have to name it that, just whatever you like.
- Click "Browse..." underneath the command-line text box, and then navigate to the directory that contains the .bat script.
- Because it will be looking for an .exe file to set in the command-line, the script will not show up when you get to the directory it's in. Just click in the file name text box at the bottom of the window and type in "patcher.bat" and press enter, or once it shows up in the drop-down box after you start typing it in, just click on it or press the down key to select it and then press enter. It will work. It should work, at least.