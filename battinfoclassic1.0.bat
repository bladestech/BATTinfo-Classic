@echo off
title BATTinfo Classic


setlocal EnableDelayedExpansion

>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo Administrator permissions are required in order to get accurate results. Please run as administrator.
    pause
    goto :eof
)


set /p Confirm=Do you want to generate a battery report? (yes/no): 
if /i "!Confirm!" neq "yes" goto :eof

set /p SaveDir=Enter the directory to save the report (leave blank for C:): 

if "!SaveDir!"=="" set SaveDir=C:

powercfg /batteryreport /output "%SaveDir%\battery_report.html"

echo ~~~~~~~~~~~~~~~~~
echo C O M P L E T E D
echo ~~~~~~~~~~~~~~~~~

set /p ConfirmLocation=Do you want to open the directory of the saved report? (yes/no): 
if /i "!ConfirmLocation!" equ "yes" (
    start explorer "%SaveDir%"
)

echo.
echo Thanks for using BATTinfo Classic!

pause
