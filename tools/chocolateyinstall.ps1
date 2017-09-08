
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://s3-eu-west-1.amazonaws.com/public-choco/forticlient/FortiClient-5.6.0.1075.msi"
$url_remote         = "https://s3-eu-west-1.amazonaws.com/public-choco/forticlient/FortiClient-5.6.0.1075.msi"
$url_local_trans    = ""
$url_remote_trans   = ""
$url                = ""
$url_trans          = ""
$checksum           = "70a3df21bf21283ae141ef53e214ce5222aac0354998721f04c5f99af1748e9d"
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

















