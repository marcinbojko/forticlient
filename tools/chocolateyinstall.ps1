
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
# $scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
#$url_local_trans    = ""
#$url_remote_trans   = ""
$url                = "https://storage.googleapis.com/chocolatey/forticlient/FortiClient-6.0.10.0297.msi"
#$url_trans          = ""
$checksum           = "d971b5152b74a2a222dc6fc6705bcb7f04bdf1cfea162035f670d997afd64678"
$logfile            = "$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log"
$logdir             = "$env:TEMP\chocolatey\$($packageName)"
$killexec           = 0
$killexecprocess    = ""
# Let's check if should we use local or remote install source
# $statusCode = Test-Path $url_local
# if ($statusCode) {
#                     $url=$url_local
#                     $url_trans=$url_local_trans
#                 }
#     else {
#         $url=$url_remote
#         $url_trans=$url_remote_trans
#     }
# # Someone has won ;)

#Let's check your TEMP derectory
if (!(Test-Path $logdir)) {
    $logfile="$env:WINDIR\TEMP\chocolatey\$($packageName).MsiInstall.log"
}

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
# silentArgs    = "/qn /norestart REINSTALLMODE=vomus REINSTALL=ALL /l*v `"$logfile`" TRANSFORMS=$url_trans"
  silentArgs    = "/qn /norestart REINSTALLMODE=vomus REINSTALL=ALL /l*v `"$logfile`""
  validExitCodes= @(0, 3010, 1641)
  url           = $url
  checksumType  = 'sha256'
  checksum      = $checksum
}

# Should we kill some exec ?
if ($killexec) {
    Stop-Process -processname $killexecprocess -force
}
# Real install
Install-ChocolateyPackage @packageArgs
