# HandBrakeCLI
PowerShell script to encode video for Plex with HandBrakeCLI
>==highlight==
>>
<pre>
In the HandBrakeCLI.ps1 file, be sure to replace anything in <> with your path or folder name
Example:
For this line: If ($_.Directory.Name -eq "`<The Name of Your Input Folder> `") {
If your input file path was "C:\Users\Me\Downloads\Completed\"
This should be changed to: If ($_.Directory.Name -eq "Completed") {
</pre>
