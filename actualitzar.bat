@echo off
echo /********	BUSCAMOS NUEVAS VERSIONES EN EL GIT	********/
call "C:\Users\Tech\Documents\git_sync.bat"
echo /********	BUSCAMOS NUEVAS VERSIONES EN EL GIT	********/
timeout /t 20
echo /********	INICIAMOS EL SERVIDOR DE SELENIUM EN UNA NUEVA VENTANA	********/
start cmd.exe /k "java -jar C:\Users\Tech\Documents\Scraper\selenium-server-standalone-3.9.1.jar"
echo /********	INICIAMOS EL SERVIDOR DE SELENIUM EN UNA NUEVA VENTANA	********/
timeout /t 60
echo /********	EJECUTAMOS EL SCRIPT	********/
php C:\Users\Tech\Documents\Scraper\instagram-public-posts.php
echo /********	EJECUTAMOS EL SCRIPT	********/