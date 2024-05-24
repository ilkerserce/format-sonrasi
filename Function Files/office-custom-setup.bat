# ODT klasörünü C:\ kök dizinine kopyalayın
Copy-Item -Path "ODT" -Destination "C:\ODT" -Recurse -Force

# C:\ODT klasörüne geçin
Set-Location -Path "C:\ODT"

# Kurulumu başlatın
Start-Process -FilePath "setup.exe" -ArgumentList "/configure configuration.xml" -Wait

# Kurulum tamamlandıktan sonra mesaj gösterin
Write-Host "Office Kurulumu tamamlandı!"
Pause
