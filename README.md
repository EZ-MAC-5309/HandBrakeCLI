# HandBrakeCLI
### A simple PowerShell script to encode video for Plex with HandBrakeCLI

`In the HandBrakeCLI.ps1 file, be sure to replace anything in <> with your path or folder name`

Example:  
If ($\_.Directory.Name -eq "`<The Name of Your Input Folder>`") {  
If your input file path is:&nbsp;&nbsp; "`C:\Users\Me\Downloads\Completed\`"  
If ($\_.Directory.Name -eq "`Completed`") {  

`This script will automatically upscale or downscale video to (720 x 540 4:3) or (720 x 406 16:9)`  
`You can change this to something else in the 720.json file`

Example for (1280 x 960 4:3) or (1280 x 720 16:9):  
"PictureWidth": `720`, `set to 1280`  
"PictureHeight": `576`, `set to 1152`  
"PictureUseMaximumSize": false,  
"PictureAllowUpscaling": true,  
"PictureForceHeight": 0,  
"PictureForceWidth": `720`, `set to 1280`
