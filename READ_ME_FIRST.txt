READ THIS FIRST
===============

This program is not signed yet, so your system may block it.
Do the steps for your system below. It takes about one minute.

WINDOWS (PowerShell script)
---------------------------
1. Unzip the whole zip to a folder (do not run it from inside the zip).
2. Right-click the folder, choose "Open in Terminal" (or open PowerShell and go to the folder).
3. Copy and paste this, then press Enter:

   Unblock-File .\*.ps1; powershell -ExecutionPolicy Bypass -File .\SCRIPT_NAME.ps1

WINDOWS (installer)
-------------------
If Windows shows "Windows protected your PC", click "More info", then "Run anyway".

MACOS
-----
If macOS says the app cannot be opened, copy and paste this in Terminal, then open the app again:

   xattr -dr com.apple.quarantine "/Applications/APP_NAME.app"

Replace SCRIPT_NAME and APP_NAME with the real names before you ship.
