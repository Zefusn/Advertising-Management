@echo off
setlocal enabledelayedexpansion

echo ========================================
echo Ad Log Analyzer
echo ========================================
echo.

if "%~1"=="" (
    echo Usage: drag log file to this batch
    echo.
    pause
    exit /b
)

if not exist "%~1" (
    echo Error: File not found
    pause
    exit /b
)

echo Analyzing: %~1
echo.

set c40101=0
set c40201=0
set c40301=0
set c40303=0
set c40402=0

for /f "usebackq tokens=*" %%a in ("%~1") do (
    echo %%a | findstr /c:"40101" >nul && set /a c40101+=1
    echo %%a | findstr /c:"40201" >nul && set /a c40201+=1
    echo %%a | findstr /c:"40301" >nul && set /a c40301+=1
    echo %%a | findstr /c:"40303" >nul && set /a c40303+=1
    echo %%a | findstr /c:"40402" >nul && set /a c40402+=1
)

echo [40101] Ad Request: !c40101!
echo [40201] Fill Success: !c40201!
echo [40301] Display: !c40301!
echo [40303] Value Report: !c40303!
echo [40402] Close: !c40402!

echo.
echo Flow Check:
echo -----------

set ok=1

if !c40101! equ 0 (
    echo - Missing: Ad Request
    set ok=0
)

if !c40201! equ 0 (
    echo - Missing: Fill Success
    set ok=0
)

if !c40301! equ 0 (
    echo - Missing: Display
    set ok=0
)

if !c40303! equ 0 (
    echo - Missing: Value Report
    set ok=0
)

if !c40402! equ 0 (
    echo - Missing: Close
    set ok=0
)

echo.
if !ok!==1 (
    echo [OK] Ad flow is NORMAL
) else (
    echo [!!] Ad flow has problems
)

echo.
pause
