#----- define parameters -----#
#----- get current date ----#
$Now = Get-Date
#----- define amount of days ----#
$Days = "7"
#----- define folder where files are located ----#
$TargetFolder = "C:\Applications\Logs"
#----- define extension ----#
$Extension = "*.log"
#----- define LastWriteTime parameter based on $Days ---#
$LastWrite = $Now.AddDays(-$Days)
 
#----- get files based on lastwrite filter and specified folder ---#
$Files = Get-Childitem $TargetFolder -Include $Extension -Recurse | Where {$_.LastWriteTime -le "$LastWrite"}
 
foreach ($File in $Files) 
    {
    if ($File -ne $NULL)
        {
        write-host "Deleting File $File" -ForegroundColor "DarkRed"
        Remove-Item $File.FullName | out-null
        }
    else
        {
        Write-Host "No more files to delete!" -foregroundcolor "Green"
        }
    }
