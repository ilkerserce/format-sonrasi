@echo off
REM ODT klasörünü C:\ kök dizinine kopyalayın
xcopy "ODT" "C:\ODT" /E /I /Y

REM CMD'yi yönetici olarak çalıştırın ve C:\ODT klasörüne geçin
cd /d C:\ODT

REM Kurulumu başlatın
setup /configure configuration.xml

REM Kurulum tamamlandıktan sonra mesaj gösterin
echo Kurulum tamamlandı!
pause
