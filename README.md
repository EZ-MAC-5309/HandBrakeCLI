# HandBrakeCLI
PowerShell script to encode video for Plex with HandBrakeCLI<br/><br/>

In the <b>HandBrakeCLI.ps1</b> file, be sure to replace anything in <b><></b> with your <b>path</b> or <b>folder</b> name<br/>
Example:<br/>
For this line: If ($_.Directory.Name -eq "<b><The Name of Your Input Folder></b>") {<br/>
If your input file path was "<b>C:\Users\Me\Downloads\Completed\</b>"<br/>
This should be changed to: If ($_.Directory.Name -eq "<b>Completed</b>") {
