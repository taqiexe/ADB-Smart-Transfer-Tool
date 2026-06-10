# ADB-Smart-Transfer-Tool
A simple batch tool to transfer files between PC and Android using ADB.
🚀 Features
Push files from PC → Phone
Pull files from Phone → PC
Uses simple commands
No extra software required (only ADB platform-tools)
📂 Setup Instructions
1. Install ADB (Platform Tools)
Download from: https://developer.android.com/tools/releases/platform-tools⁠�
Extract it anywhere like:

C:\adb\platform-tools\
2. Enable Developer Mode on Phone
Go to:
Settings → About Phone
Tap “Build Number” 7 times
Enable:
USB Debugging
3. Create Phone Folder (IMPORTANT)
On your phone:

Internal Storage → create folder:
Files
Path will be:

/sdcard/Files
4. Edit BAT File (IMPORTANT)
Open adb_shell.bat with Notepad and edit:
Batch file
set LOCAL_DIR=C:\Users\Administrator\Downloads
Change Administrator if your Windows username is different.
5. Run Tool
Double click:

adb_shell.bat
🧠 Commands
Send file to phone

push filename.zip
Get file from phone

pull filename.zip
Restart ADB (if stuck)

restartadb
Exit

exit
📱 Phone Folder
All files will go to:

/sdcard/Files
Make sure this folder exists.
⚡ Requirements
Windows PC
ADB (platform-tools)
USB debugging enabled
💡 Notes
Works only with USB connection
Keep BAT file in same folder as adb.exe
⚠️ Important: File names must not contain spaces. Please rename your file to a single word (e.g., use example22.png instead of example 22.png).
