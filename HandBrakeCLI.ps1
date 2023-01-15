# Replace anything in <> with your own path to HandBrakeCLI.exe, your input folder, your output folder, etc...
# Declare the variables
$FILE         =  0
$HandBrakeCLI =  "C:\<Path>\<To>\HandBrakeCLI.exe"
$Preset       =  "C:\<Path>\<To>\720.json"
$DEST         =  "C:\<Path>\<To>\<Output>\<Folder>\"
$LIST         =  Get-ChildItem "C:\<Path>\<To>\<Input>\<Folder>\" -Include *.mkv,*.wmv,*.mp4,*.avi,*.ts,*.VOB -Recurse | ?{$_.BaseName -notlike "*sample*" -and $_.Directory.BaseName -notlike "*_UNPACK*"}

# Parse the list
$LIST | % -Begin {
    # Start with a fresh screen
    Clear-Host
} -Process {
    # Increment the file count
    $FILE++
    # Declare the source path
    $Source = $_.FullName
    # Declare the saveas path
    If ($_.Directory.Name -eq "<The Name of Your Input Folder>") {
        $SaveAs = $DEST + $_.BaseName + ".mp4"
    } Elseif ($_.BaseName -like "*$(($_.Directory.BaseName).Substring(0,4))*") {
        $SaveAs = $DEST + $_.BaseName + ".mp4"
    } Else {
        $SaveAs = $DEST + $_.Directory.BaseName + ".mp4"
    }

    # Write the working message
    Write-Host "`n|$("-" * ($Source.Length + 10))|"
    Write-Host "|" -ForegroundColor White -NoNewline; Write-Host " Handbrake Encoding $FILE of $($LIST.Count)... " -ForegroundColor Yellow -NoNewline; Write-Host "$(" " * ($Source.Length - 18 - $FILE.ToString().Length - $($LIST.Count).ToString().Length))|" -ForegroundColor White
    Write-Host "|$("-" * ($Source.Length + 10))|"
    Write-Host "| Source: $($Source) |"
    Write-Host "| SaveAs: $($SaveAs + " " * ($Source.Length - $SaveAs.Length)) |"
    Write-Host "|$("-" * ($Source.Length + 10))|`n"

    # Start HandBrakeCLI
    & $HandBrakeCLI --preset-import-file $Preset -i $Source -o $SaveAs >$null 2>&1

    # Delete the source file
    If ($SaveAs -eq $DEST + $($_.BaseName) + ".mp4") {
        Remove-Item -Path $_.FullName -Force
        If ($_.Directory.Name -ne "<The Name of Your Input Folder>") {
            $Count = (Get-ChildItem -Path $_.DirectoryName -Include *.mkv,*.wmv,*.mp4,*.avi,*.ts,*.VOB -Recurse | ?{$_.BaseName -notlike "*sample*"}).Count
            If ($Count -eq 0) {
                Remove-Item -Path $_.DirectoryName -Force -Recurse
            }
        }
    } Else {
        Remove-Item -Path $_.DirectoryName -Force -Recurse
    }
} -End {
    # Write the completion message
    Write-Host "`n|$("-" * (9 + $FILE.ToString().Length + 4 + $LIST.Count.ToString().Length + 11))|"
    Write-Host "|" -ForegroundColor White -NoNewline; Write-Host " File(s) $FILE of $($LIST.Count) Completed " -ForegroundColor Cyan -NoNewline; Write-Host "|" -ForegroundColor White
    Write-Host "|$("-" * (9 + $FILE.ToString().Length + 4 + $LIST.Count.ToString().Length + 11))|`n"
}
