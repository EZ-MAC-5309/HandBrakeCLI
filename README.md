# HandBrakeCLI
PowerShell script to encode video for Plex with HandBrakeCLI

>In the `HandBrakeCLI.ps1` file, be sure to replace anything in `<>` with your `path` or `folder name`
&Newline;  
Example:
&Newline;  
For this line: If ($_.Directory.Name -eq "`<The Name of Your Input Folder>`") {
&Newline;  
If your input file path was "`C:\Users\Me\Downloads\Completed\`"
&Newline;  
This should be changed to: If ($_.Directory.Name -eq "`Completed`") {
