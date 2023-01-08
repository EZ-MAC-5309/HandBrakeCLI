# HandBrakeCLI
PowerShell script to encode video for Plex with HandBrakeCLI

>In the `HandBrakeCLI.ps1` file, be sure to replace anything in `<>` with your `path` or `folder name`
&nbsp;
Example:
&nbsp;
For this line: If ($_.Directory.Name -eq "`<The Name of Your Input Folder>`") {
&nbsp;
If your input file path was "`C:\Users\Me\Downloads\Completed\`"
&nbsp;
This should be changed to: If ($_.Directory.Name -eq "`Completed`") {
