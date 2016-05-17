
$ErrorActionPreference = 'Stop';


$packageName= 'forticlient'
$scriptPath =  $(Split-Path $MyInvocation.MyCommand.Path)
$fileFullPath = Join-Path $scriptPath 'FortiClient.msi'
$fileFullPathMST = Join-Path $scriptPath 'FortiClient.mst'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" TRANSFORMS=$fileFullPathMST"
  validExitCodes= @(0, 3010, 1641)
  file          = $fileFullPath
}

try {
  Install-ChocolateyInstallPackage @packageArgs
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}


















