@echo off
title ADB Smart Transfer Tool
color 0a
setlocal enabledelayedexpansion

:: ===================== CONFIG (EDIT THIS) =====================
set ADB=adb.exe
set PHONE_DIR=/sdcard/Files
set LOCAL_DIR=C:\Users\Administrator\Downloads
:: =============================================================

:: Start ADB server
%ADB% start-server >nul 2>&1

:menu
cls
echo =====================================
echo     ADB SMART TRANSFER TOOL
echo =====================================
echo.
echo Commands:
echo   push filename
echo   pull filename
echo   restartadb
echo   exit
echo.
set /p cmd=ADB^> 

if /i "%cmd%"=="exit" exit /b

if /i "%cmd%"=="restartadb" (
    %ADB% kill-server >nul 2>&1
    %ADB% start-server >nul 2>&1
    echo ADB restarted.
    pause
    goto menu
)

for /f "tokens=1,2" %%a in ("%cmd%") do (
    set action=%%a
    set file=%%b
)

:: ================= PUSH =================
if /i "!action!"=="push" (
    set FILE=%LOCAL_DIR%\!file!

    if not exist "!FILE!" (
        echo ERROR: File not found in PC folder
        echo !FILE!
        pause
        goto menu
    )

    echo.
    echo Uploading to phone...
    echo From: !FILE!
    echo To: %PHONE_DIR%
    echo.

    %ADB% push "!FILE!" "%PHONE_DIR%"

    echo.
    echo DONE ✔
    pause
    goto menu
)

:: ================= PULL =================
if /i "!action!"=="pull" (
    if "!file!"=="" (
        echo Usage: pull filename.ext
        pause
        goto menu
    )

    echo.
    echo Downloading from phone...
    echo From: %PHONE_DIR%/!file!
    echo To: %LOCAL_DIR%
    echo.

    %ADB% pull "%PHONE_DIR%/!file!" "%LOCAL_DIR%"

    echo.
    echo DONE ✔
    pause
    goto menu
)

echo Invalid command
pause
goto menu