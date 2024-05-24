# Hızlı Erişimde son kullanılan dosyaları göster seçeneğini kapat
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowRecent" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Value 0

# Hızlı Erişimde sık kullanılan klasörleri göster seçeneğini kapat
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowFrequent" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Value 0

# Windows Gezgini'ni yeniden başlatmak
Stop-Process -Name "explorer" -Force
Start-Process "explorer"

# Dosya Gezgini geçmişini temizle
$cachePath = "$env:APPDATA\Microsoft\Windows\Recent\*"
Remove-Item -Path $cachePath -Force -Recurse

Write-Host "Ayarlar uygulandı ve Dosya Gezgini geçmişi temizlendi."
Pause
