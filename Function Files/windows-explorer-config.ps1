# Betik yürütme ilkesini geçici olarak ayarlamak
$currentPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Ana betiğinizi buraya yazın
# Görev görünümü düğmesini gizlemek
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0

# Arama simgesini göstermek
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 1

# Windows Gezgini'ni yeniden başlatmak
Stop-Process -Name "explorer" -Force
Start-Process "explorer"

Write-Host "Tum degisiklikler uygulandi."

# Orijinal yürütme ilkesine geri dönmek (isteğe bağlı)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy $currentPolicy -Force

Pause
