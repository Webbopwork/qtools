@echo off
title WPKF (WindowsProductKeyFinder)
echo Program WPKF(WindowsProductKeyFinder) by Webbop 2024
echo:
echo:
echo Following is your 25-digit product key for Windows in the format of XXXXX-XXXXX-XXXXX-XXXXX-XXXXX:
echo:
if [%1] EQU [--force-powershell] goto psMethod
if [%2] EQU [--force-powershell] goto psMethod
where /q wmic
if %ERRORLEVEL% NEQ 0 goto psMethod
wmic path softwareLicensingService get OA3xOriginalProductKey
goto done
:psMethod
echo:
powershell "(Get-WmiObject -query 'select * from          SoftwareLicensingService').OA3xOriginalProductKey"
:done
if [%1] EQU [--no-pause] goto after
if [%2] EQU [--no-pause] goto after
echo:
echo:
echo [Pressing any key to continue simply closes the program]
rem exit /B 1
pause
:after