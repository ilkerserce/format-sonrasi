# Bu betiğin bulunduğu dizini al
$currentDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# WinRAR kurulumunu başlat
Start-Process -FilePath "$currentDir\WinRAR\winrar-setup.exe" -Wait

# VLC kurulumunu başlat
Start-Process -FilePath "$currentDir\VLC\vlc-setup.exe" -Wait

# Chrome kurulumunu başlat
Start-Process -FilePath "$currentDir\Chrome\chrome-setup.exe" -Wait

# Chrome'u varsayılan tarayıcı olarak ayarlamak için
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$defaultBrowserCommand = "$chromePath --make-default-browser"
Start-Process -FilePath $chromePath -ArgumentList "--make-default-browser" -Wait

Write-Host "Tüm kurulumlar tamamlandı ve Chrome varsayılan tarayıcı olarak ayarlandı!"
