
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
# $scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://storage.googleapis.com/chocolatey/forticlient/FortiClient-5.6.6.1167.msi"
$url_remote         = "https://storage.googleapis.com/chocolatey/forticlient/FortiClient-5.6.6.1167.msi"
$url_local_trans    = ""
$url_remote_trans   = ""
$url                = ""
$url_trans          = ""
$checksum           = "8b11e47053e1c6c49a73ff906fd8db9bc22a3abeca412bca2b0a16dcbb4d943c"
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

  Install-ChocolateyPackage @packageArgs
