# Bu betiğin bulunduğu dizini al
$scriptDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

# Microsoft Office klasörünün yolunu belirle
$officeDir = Join-Path -Path $scriptDir -ChildPath "Microsoft Office"

# ODT klasörünün yolunu belirle
$odtSourceDir = Join-Path -Path $officeDir -ChildPath "ODT"
$odtDestinationDir = "C:\ODT"

# ODT klasörünü C:\ kök dizinine kopyalayın
Copy-Item -Path $odtSourceDir -Destination $odtDestinationDir -Recurse -Force

# C:\ODT klasörüne geçin
Set-Location -Path $odtDestinationDir

# Kurulumu başlatın
Start-Process -FilePath "setup.exe" -ArgumentList "/configure configuration.xml" -Wait

# Kurulum tamamlandıktan sonra ODT klasörünü sil
Remove-Item -Path $odtDestinationDir -Recurse -Force

# Kurulum tamamlandıktan sonra mesaj gösterin
Write-Host "Office Kurulumu tamamlandı ve ODT klasörü silindi!"
Pause
