
@echo off
title wearmed Utility

openfiles >nul 2>&1
if errorlevel 1 PowerShell -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c %~dpnx0'" & exit

for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuildNumber"') do set BuildNumber=%%b

if /I %BuildNumber% GEQ 21996 set OSVer=Windows 11 & goto main
set OSVer=Unsupported OS

:main
echo.                                      
echo.                                      
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  wearmedUtil "Dev"
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  %OSVer% (%BuildNumber%)
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   Made by:
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   wearmed
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   galexit          
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo   ============================
echo   1. Optimisations
echo   2. Other scripts
echo   3. Applications
echo   4. Troubleshooting
echo   5. Join my discord server!
echo   ============================
echo.    

set /p option=Enter the option number: 
if %option%==1 goto optimisations
if %option%==2 goto scripts
if %option%==3 goto apps
if %option%==4 goto troubleshoot
if %option%==5 goto discord

:optimisations
title wearmed Utility - Optimisations
cls
echo.                                       
echo.                                     
echo   ======================================================================
echo    1. Set services to manual                     2. Remove bloatware   
echo    3. Enable/disable Windows Defender            4. Clear temp folders 
echo    5. Disable telemetry                          6. Run ShutUp10        
echo    7. Enable/disable hibernation                 8. Run disk cleanup
echo   ======================================================================
echo.
echo.

set /p option=Enter the option number:
if %option%==1 goto services
if %option%==2 goto debloat
if %option%==3 goto defender
if %option%==4 goto temp
if %option%==5 goto telemetry
if %option%==6 goto stfu
if %option%==7 goto hibernation
if %option%==8 goto cleanup

