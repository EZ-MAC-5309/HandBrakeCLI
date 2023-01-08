# Declare the variables
$FILE          =  0
$HandBrakeCLI  =  "C:\<Path>\<To>\HandBrakeCLI.exe" # Replace anything in <> with your path to HandBrakeCLI.exe
$DEST          =  "C:\<Path>\<To>\<Output>\<Folder>\" # Replace anything in <> with your path to the destination folder
$LIST          =  Get-ChildItem "C:\<Path>\<To>\<Input>\<Folder>\" -Include *.mkv,*.wmv,*.mp4,*.avi,*.ts -Recurse | ?{$_.BaseName -notlike "*sample*"} # Replace anything in <> with your path to the input folder
$TOTAL         =  $LIST.Count

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
    If ($_.Directory.Name -eq "<The Name of Your Input Folder>") { # Check if this is a file or a folder...Replace <The Name of Your Input Folder> with the actual name of your input folder
        $SaveAs = $DEST + $_.BaseName + ".mp4"
    } Elseif ($_.BaseName -like "*$(($_.Directory.BaseName).Substring(0,5))*") { # Check if the file name is not obfuscated
        $SaveAs = $DEST + $_.BaseName + ".mp4"
    } Else { # If the file name is obfuscated, name it with the directory name
        $SaveAs = $DEST + $_.Directory.BaseName + ".mp4"
    }
 
    # Write the working message
    "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
    Write-Host "Handbrake Encoding $FILE of $TOTAL..." -ForegroundColor Yellow
    "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
    "Source: $Source"
    "SaveAs: $SaveAs"
    "----------------------------------------------------------------------------------------------------------------------------------------------------------------"

    # Start HandBrakeCLI
    If ($_.Directory.BaseName -like "*_UNPACK*") { # Check if this is an unpacking folder (for SABNZBD)
    } Else {
        & $HandBrakeCLI -i $Source -o $SaveAs --main-feature -e x264 -q 23 -w 720 -B 160 -X 720 -O --non-anamorphic --crop 0:0:0:0 --keep-display-aspect --min-duration 180 --all-audio -E ac3 >$null 2>&1
    }

    # Delete the source file
    If ($_.Directory.BaseName -like "*_UNPACK*") { # Check if this is an unpacking folder (for SABNZBD)
    } Else {
        If ($_.Directory.Name -eq "<The Name of Your Input Folder>") { # Check if this is a file or a folder...Replace <The Name of Your Input Folder> with the actual name of your input folder
            Remove-Item -Path $_.FullName -Force
        } Else { # If it is a folder, remove it recursively
            Remove-Item -Path $_.DirectoryName -Force -Recurse
        }
    }
} -End {
    # Write the completion message
    "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
    Write-Host "File(s) $FILE of $TOTAL Completed" -ForegroundColor Cyan
    "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
}
