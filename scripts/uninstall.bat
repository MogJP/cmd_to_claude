@echo off
REM Claude Code Wrapper Uninstallation Script
REM This script removes the claude.bat wrapper from PATH configuration using setx

echo Claude Code WSL Wrapper Uninstallation Script
echo ============================================

REM Set target directory
set TARGET_DIR=C:\Tools\claude\

echo Target directory: %TARGET_DIR%

REM Get current PATH
echo Checking current PATH environment variable...
set "CURRENT_PATH=%PATH%"

echo Current PATH: %CURRENT_PATH%

echo ========================================
echo MANUAL PATH REMOVAL REQUIRED
echo ========================================
echo.
echo For safety reasons, you must manually remove the following path
echo from your Windows PATH environment variable:
echo.
echo PATH TO REMOVE: %TARGET_DIR%
echo.
echo INSTRUCTIONS:
echo 1. Press Win + R, type 'sysdm.cpl', press Enter
echo 2. Click 'Advanced' tab -^> 'Environment Variables' button
echo 3. In 'User variables' section, select 'Path' -^> click 'Edit'
echo 4. Find and select: %TARGET_DIR%
echo 5. Click 'Delete' button
echo 6. Click 'OK' on all dialogs
echo 7. Restart VSCode or Command Prompt
echo.
echo WARNING: Only modify User PATH, do NOT touch System PATH!
echo.
set /p CONTINUE="Press Enter after you have manually removed the PATH..."

echo.
echo =========================
echo [OK] Uninstallation complete!
echo =========================
echo.
echo Changes made:
echo - PATH setup: Manual removal (safer method)
echo - Location: User environment variables only
echo.
echo IMPORTANT: PATH was NOT automatically modified for safety.
echo You must manually remove the path as instructed above.
echo.
REM Optionally delete the installed directory
echo.
set /p DELETE_DIR="Delete installed directory %TARGET_DIR%? (y/N): "
if /i "%DELETE_DIR%"=="y" (
    if exist "%TARGET_DIR%" (
        echo Deleting directory: %TARGET_DIR%
        timeout /t 2 /nobreak >nul
        
        rmdir /s /q "%TARGET_DIR%"
        if exist "%TARGET_DIR%" (
            echo [WARNING] Failed to delete directory automatically
            echo.
            echo MANUAL DELETION REQUIRED:
            echo 1. Close all Command Prompt and VSCode windows
            echo 2. Navigate to: %TARGET_DIR%
            echo 3. Delete the folder manually
            echo.
            echo Or run this command later:
            echo rmdir /s /q "%TARGET_DIR%"
        ) else (
            echo [OK] Directory deleted successfully
        )
    ) else (
        echo [INFO] Directory does not exist
    )
) else (
    echo [INFO] Directory not deleted: %TARGET_DIR%
)
echo.
pause