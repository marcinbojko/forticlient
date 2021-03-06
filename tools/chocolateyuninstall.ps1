
$ErrorActionPreference = 'Stop';

$packageName = 'forticlient'
$softwareName = 'FortiClient*'
$installerType = 'MSI'
$UninstallGuid =  '{B611B858-9363-42FC-AE47-3430D54CCE1B}'

$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)
if ($installerType -ne 'MSI') {
  $validExitCodes = @(0)
}

#$uninstalled = $false
$local_key     = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key   = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$machine_key6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

$key = Get-ItemProperty -Path @($machine_key6432,$machine_key, $local_key) -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "$softwareName" }| Measure-Object

if ($key.Count -eq 1) {

  if ($validExitCodes -NotContains (Start-Process -FilePath msiexec -ArgumentList "/x $UninstallGuid $silentArgs" -Wait -Passthru).ExitCode)
        {
            Throw " Forticlient is probably registered, try to force unregistering/disable complance"
        }

} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
  write-host $key.Count
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  write-host $key.Count
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}



