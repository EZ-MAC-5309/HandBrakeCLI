# HandBrakeCLI
### A simple PowerShell script to encode video for Plex with HandBrakeCLI

`In the HandBrakeCLI.ps1 file, be sure to replace anything in <> with your path or folder name`

Example:  
If ($\_.Directory.Name -eq "`<The Name of Your Input Folder>`") {  
If your input file path is:&nbsp; "`C:\Users\Me\Downloads\Completed\`"  
If ($\_.Directory.Name -eq "`Completed`") {  

`This script will automatically upscale or downscale video to (720 x 540 4:3) or (720 x 406 16:9)`

You can change this to something else in the following line:  
& $HandBrakeCLI -i $Source -o $SaveAs -e x264 -q 23 -w 720 -B 160 -X 720 -O --non-anamorphic --crop 0:0:0:0 --keep-display-aspect --audio-lang-list eng -E ac3 >$null 2>&1
