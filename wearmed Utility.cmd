@echo off
title wearmed Utility

IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs" & del "%temp%\getadmin.vbs" & exit /B
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

for /F "tokens=2* skip=2" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentBuildNumber"') do set BuildNumber=%%b

if /I %BuildNumber% GEQ 21996 set OSVer=Windows 11
if "%OSVer%" neq "Windows 11" (set OSVer=Unsupported OS)

:main
echo.                                      
echo.                                      
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  wearmed Utility "Dev"
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  %OSVer% (%BuildNumber%)
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  Made by wearmed and galexitc
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww  
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww                
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo    wwwwwwwwwwwwwww   wwwwwwwwwwwwwww
echo.
echo   ============================
echo   1. Optimisations
echo   2. Other scripts
echo   3. Applications
echo   4. Fix Windows Updates
echo   5. Join my discord server!
echo   ============================
echo.    

set /p option=Enter the option number: 
if %option%==1 goto optimisations
if %option%==2 goto scripts
if %option%==3 goto apps
if %option%==4 goto fixupdates
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

