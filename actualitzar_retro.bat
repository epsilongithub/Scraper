@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
echo /******** ELIMINAMOS LOS PROCESOS EN EJECUCCION ANTES DE FINALIZAR Y ACTUALIZAR FICHEROS	********/
taskkill /IM "php.exe" /f
taskkill /IM "chrome.exe" /f
taskkill /IM "chromedriver.exe" /f
taskkill /IM "java.exe" /f
echo /******** ELIMINAMOS LOS PROCESOS EN EJECUCCION ANTES DE FINALIZAR Y ACTUALIZAR FICHEROS	********/

echo /******** ELIMINAMOS Y VOLVEMOS A MAPEAR LA UNIDAD COMPARTIDA Y COPIAMOS LOS FICHEROS	********/
net use X: /delete /y
net use X: \\192.168.7.38\Users\Tech\Documents\Scripts_Originales
Xcopy X:\ C:\Users\Tech\Documents\Scraper\ /Y
net use X: /delete /y
echo /******** ELIMINAMOS Y VOLVEMOS A MAPEAR LA UNIDAD COMPARTIDA Y COPIAMOS LOS FICHEROS	********/

echo /******** INICIAMOS EL SELENIUM EN UNA NUEVA VENTANA. MIENTRAS SE ESPERA 10 SEGUNDOS A EJECUTARSE EL PHP	********/
start cmd.exe /k "java -jar C:\Users\Tech\Documents\Scraper\selenium-server-standalone-3.9.1.jar"
net use X: /delete /y
timeout /t 10
net use X: /delete /y
php C:\Users\Tech\Documents\Scraper\instagram-public-posts_restroespectiva.php

