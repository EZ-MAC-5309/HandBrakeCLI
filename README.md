# HandBrakeCLI
### A simple PowerShell script to encode video for Plex with HandBrakeCLI

In the `HandBrakeCLI.ps1` file, be sure to replace anything in `<>` with your `path or folder name`<br>
Example:<br>
For this line: If ($_.Directory.Name -eq "`<The Name of Your Input Folder>`") {<br>
If your input file path was "`C:\Users\Me\Downloads\Completed\`"<br>
This should be changed to: If ($_.Directory.Name -eq "`Completed`") {<br>

This script will automatically upscale or downscale video to (720 x 540 4:3) or (720 x 406 16:9)<br>
You can change this to something else in the following line:<br>
& $HandBrakeCLI -i $Source -o $SaveAs --main-feature -e x264 -q 23 -w `720` -B 160 -X `720` -O --non-anamorphic --crop 0:0:0:0 --keep-display-aspect --min-duration 180 --all-audio -E ac3 >$null 2>&1
