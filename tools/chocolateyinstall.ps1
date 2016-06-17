
$ErrorActionPreference = 'Stop';

$packageName        = 'forticlient'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "\\office.eleader.biz\wymiana\packages\choco\FortiClient-5.4.0837.msi"
$url_remote         = "https://dl.dropboxusercontent.com/u/6066664/choco/forticlient/FortiClient-5.4.0837.msi"
$url_local_trans    = "\\office.eleader.biz\wymiana\packages\choco\FortiClient-5.4.0837.mst"
$url_remote_trans   = "https://dl.dropboxusercontent.com/u/6066664/choco/forticlient/FortiClient-5.4.0837.mst"
$url                = ""
$url_trans          = ""
$checksum           = "acf2fc841a6f28d5dfb7de2a9db03083"

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

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart REINSTALLMODE=vomus REINSTALL=ALL /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" TRANSFORMS=$url_trans"
  validExitCodes= @(0, 3010, 1641)
  url           = $url
  checksumType  = 'md5'
  checksum      = $checksum
}

try {
  Install-ChocolateyPackage @packageArgs
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}


















