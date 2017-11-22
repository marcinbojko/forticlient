
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://s3-eu-west-1.amazonaws.com/public-choco/forticlient/FortiClient-5.6.2.1117.msi"
$url_remote         = "https://s3-eu-west-1.amazonaws.com/public-choco/forticlient/FortiClient-5.6.2.1117.msi"
$url_local_trans    = ""
$url_remote_trans   = ""
$url                = ""
$url_trans          = ""
$checksum           = "b44bef47541e423fa8f3e22bb687f3e317e8df1b9735394e3f774a2b88d1678c"
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

















