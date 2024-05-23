$currentDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

Start-Process -FilePath "$currentDir\WinRAR\winrar-setup.exe" -Wait
Start-Process -FilePath "$currentDir\VLC\vlc-setup.exe" -Wait
Start-Process -FilePath "$currentDir\Chrome\chrome-setup.exe" -Wait

Write-Host "Tüm kurulumlar tamamlandi!"