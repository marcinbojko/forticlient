
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "\\office.eleader.biz\wymiana\packages\choco\FortiClient-5.4.0840.msi"
$url_remote         = "https://dl.dropboxusercontent.com/u/6066664/choco/forticlient/FortiClient-5.4.0840.msi"
$url_local_trans    = "\\office.eleader.biz\wymiana\packages\choco\FortiClient-5.4.0840.mst"
$url_remote_trans   = "https://dl.dropboxusercontent.com/u/6066664/choco/forticlient/FortiClient-5.4.0840.mst"
$url                = ""
$url_trans          = ""
$checksum           = "7231b87f097edfccaa2f70e87f71be9c"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"
$killexec           = 0
$killexecprocess    = ""
# Let's check if should we use local or remote install source
$statusCode = Test-Path $url_local 
if ($statusCode) {
                    $url=$url_local
                    $url_trans=$url_local_trans    
                }
    else {
        $url=$url_remote
        $url_trans=$url_remote_trans
    }
# Someone has won ;)

#Let's check your TEMP derectory

$statusCode = Test-Path $logdir
if ($statusCode) {
                        
                }
    else {
        $logfile="$env:WINDIR\TEMP\chocolatey\$($packageName).MsiInstall.log"
        
    }

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart REINSTALLMODE=vomus REINSTALL=ALL /l*v `"$logfile`" TRANSFORMS=$url_trans"
  validExitCodes= @(0, 3010, 1641)
  url           = $url
  checksumType  = 'md5'
  checksum      = $checksum
}

# Should we kill some exec ?
if ($killexec) {
  Stop-Process -processname $killexecprocess -force
  } 

  Install-ChocolateyPackage @packageArgs

















