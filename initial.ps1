$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

#Setup
$currentDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Start-Process -FilePath "$currentDir\WinRAR\winrar-setup.exe" -Wait
Start-Process -FilePath "$currentDir\VLC\vlc-setup.exe" -Wait
Start-Process -FilePath "$currentDir\Chrome\chrome-setup.exe" -Wait

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$defaultBrowserCommand = "$chromePath --make-default-browser"
Start-Process -FilePath $chromePath -ArgumentList "--make-default-browser" -Wait

Write-Host "Winrar, VLC, Chrome Kurulumu tamamlandi ve Chrome varsayilan tarayici yapildi!"

# Office
$scriptDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$officeDir = Join-Path -Path $scriptDir -ChildPath "Microsoft Office"
$odtSourceDir = Join-Path -Path $officeDir -ChildPath "ODT"
$odtDestinationDir = "C:\ODT"
Copy-Item -Path $odtSourceDir -Destination $odtDestinationDir -Recurse -Force
Set-Location -Path $odtDestinationDir
Start-Process -FilePath "setup.exe" -ArgumentList "/configure configuration.xml" -Wait
Start-Sleep -Seconds 3
Remove-Item -Path $odtDestinationDir -Recurse -Force
Write-Host "Office Kurulumu tamamlandi ve ODT klasoru silindi!"

# Arama ve Gorev cubuğu Config
$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 1
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
Start-Sleep -Seconds 3
Write-Host "Arama simgesi ve gorev gorunumu icin degisiklikler uygulandi."

# Clear
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowRecent" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowFrequent" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Value 0
Stop-Process -Name "explorer" -Force
Start-Process "explorer"
$cachePath = "$env:APPDATA\Microsoft\Windows\Recent\*"
Remove-Item -Path $cachePath -Force -Recurse
Write-Host "Ayarlar uygulandi ve Dosya Gezgini gecmisi temizlendi."

Set-ExecutionPolicy -Scope Process -ExecutionPolicy $currentPolicy -Force
Write-Host "Tum kurulumlar tamamlandi ve Chrome varsayilan tarayici olarak ayarlandi!"

Pause
