
@echo off
title wearmed Utility

    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    color 09
    echo [INFO] Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" >nul && set Arch=x86 || set Arch=x64
for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuildNumber"') do set BuildNumber=%%b
if /I %BuildNumber% GEQ 21996 set OSVer=Windows 11 & goto main
set OSVer=Unsupported OS
:main
color F
title WeArmed Utility - %OSVer% %Arch% (%BuildNumber%)
echo.                                      
echo.                                   
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  wearmedUtil "Dev"
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  %OSVer% %Arch% (%BuildNumber%)
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   Made by:
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   wearmed
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   galexit       
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   vart [CONTRIB]
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww   
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo   ============================
echo   1. Optimizations
echo   2. Other scripts
echo   3. Applications
echo   4. Troubleshooting
echo   ============================
echo.    
set /p option="~~~>"
if %option%==1 goto optimizations
if %option%==2 goto scripts
if %option%==3 goto apps
if %option%==4 goto troubleshoot
if %option%==5 goto discord
color C 
cls
echo [ERROR] Invalid Option, Try Again. 
timeout /t 2 >nul
cls
color F
goto main

:optimizations
title WeArmed Utility - Optimizations
cls
echo.                                       
echo.                                     
echo   ======================================================================
echo    1. Set services to manual                     2. Remove bloatware   
echo    3. Disable Windows Defender                   4. Clear temp folders 
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

color C 
cls
echo [ERROR] Invalid Option, Try Again. 
timeout /t 2 >nul
cls
color F
goto :optimizations
pause
goto end


:cleanup
cls
color 09
echo [INFO] Running disk cleanup...
cleanmgr.exe
color F 
goto :optimizations

:stfu
cls
color 09
echo [INFO] Downloading ShutUp10 to temp directory...
curl -s -o "%temp%\stfu10.exe" "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
echo [INFO] Running ShutUp10...
%temp%/stfu10.exe
color F 
goto :optimizations

:temp
cls
color 09
echo [INFO] Deleting %temp%
del /f /q "%temp%\*.*" 
echo [INFO] Deleting C:\Windows\Temp
del /f /q "C:\Windows\Temp\*.*" 
echo [INFO] Deleting C:\Windows\SoftwareDistribution\Download\
del /f /q "C:\Windows\SoftwareDistribution\Download\*.*"
echo [INFO] Done.
timeout /t 1 >nul
color F 
goto :optimizations

:defender
cls
color 09
echo [INFO] Deactivating Windows Defender...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
echo [INFO] Done.
timeout /t 1 >nul
echo [INFO] If you want to see the changes, make a system restart.
timeout /t 1 >nul
color F 
goto :optimizations
