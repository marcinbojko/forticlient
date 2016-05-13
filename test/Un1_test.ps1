 Import-Module C:\ProgramData\chocolatey\helpers\chocolateyInstaller.psm1

 #$key=Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* -erroraction SilentlyContinue |? { $_.DisplayName -like "forticlient*" }
 #write-host $key
 #$key | % {$file = "$($_.UninstallString)"}
 #write-host $file
 #Uninstall-ChocolateyPackage -packageName "forticlient" -silentArgs "" -validExitCodes "0" -fileType MSI 
 #-file $file
 Start-Process -Wait msiexec -ArgumentList @("/x","{B5E0B33F-91D4-408B-BE40-46BCA75F3914}","/qn /promptrestart")
