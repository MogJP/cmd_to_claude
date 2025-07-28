@echo off
REM Claude Code Wrapper Installation Script
REM This script sets up the claude.bat wrapper for WSL integration using setx command

echo Claude Code WSL Wrapper Installation Script
echo ==========================================

REM Get current directory and set target directory
set SCRIPT_DIR=%~dp0
set TARGET_DIR=C:\Tools\claude\

echo Script directory: %SCRIPT_DIR%
echo Target directory: %TARGET_DIR%

REM Check if claude.bat exists in source directory
if not exist "%SCRIPT_DIR%claude.bat" (
    echo [ERROR] claude.bat not found in %SCRIPT_DIR%
    echo Claude.bat file not found.
    pause
    exit /b 1
)

echo [OK] claude.bat file found in source directory

REM Create target directory
echo Creating target directory...
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
    if %errorlevel% neq 0 (
        echo [ERROR] Failed to create directory %TARGET_DIR%
        echo Please check permissions.
        pause
        exit /b 1
    )
    echo [OK] Target directory created: %TARGET_DIR%
) else (
    echo [OK] Target directory already exists: %TARGET_DIR%
)

REM Copy claude.bat to target directory
echo Copying claude.bat to target directory...
copy "%SCRIPT_DIR%claude.bat" "%TARGET_DIR%claude.bat" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Failed to copy claude.bat to %TARGET_DIR%
    echo Please check permissions.
    pause
    exit /b 1
)

echo [OK] claude.bat copied to target directory

REM Check WSL availability
echo Checking WSL...
where wsl >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] WSL not found. Please install WSL first.
    echo WSL is not installed. Please install WSL first.
    pause
    exit /b 1
)

REM Test WSL
wsl echo "WSL test successful" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] WSL is not working properly.
    echo WSL is not working properly.
    pause
    exit /b 1
)

echo [OK] WSL working properly

echo [INFO] Skipping Claude existence check (managed by VSCode extension)

echo ========================================
echo MANUAL PATH CONFIGURATION REQUIRED
echo ========================================
echo.
echo For safety reasons, you must manually add the following path to your
echo Windows PATH environment variable:
echo.
echo PATH TO ADD: %TARGET_DIR%
echo.
echo INSTRUCTIONS:
echo 1. Press Win + R, type 'sysdm.cpl', press Enter
echo 2. Click 'Advanced' tab -^> 'Environment Variables' button
echo 3. In 'User variables' section, select 'Path' -^> click 'Edit'
echo 4. Click 'New' and add: %TARGET_DIR%
echo 5. Click 'OK' on all dialogs
echo 6. Restart VSCode or Command Prompt
echo.
echo WARNING: Do NOT modify System PATH, only User PATH!
echo.
set /p CONTINUE="Press Enter after you have manually added the PATH..."

REM Test the wrapper
echo.
echo Testing claude.bat...
call "%TARGET_DIR%claude.bat" --version
if %errorlevel% equ 0 (
    echo [OK] Test successful!
) else (
    echo [WARNING] Test produced warnings or errors.
)

echo.
echo ======================
echo [OK] Installation complete!
echo ======================
echo.
echo Configuration:
echo - Installed to: %TARGET_DIR%
echo - PATH setup: Manual (safer method)
echo - Location: User environment variables only
echo.
echo IMPORTANT: PATH was NOT automatically modified for safety.
echo You must manually add the path as instructed above.
echo.
echo Run test.bat for complete verification.
echo.
pause