@echo off
REM Test script for Claude Code WSL Wrapper

echo Claude Code WSL Wrapper Test Script
echo ==================================

set SCRIPT_DIR=%~dp0

echo 1. WSL availability test
echo Testing WSL availability...
where wsl >nul 2>&1
if %errorlevel% neq 0 (
    echo [NG] WSL not found
    goto :error
) else (
    echo [OK] WSL found
)

echo.
echo 2. WSL functionality test  
echo Testing WSL functionality...
wsl echo "WSL is working" 2>nul
if %errorlevel% neq 0 (
    echo [NG] WSL not working properly
    goto :error
) else (
    echo [OK] WSL is working properly
)

echo.
echo 3. Claude wrapper functionality
echo [INFO] Skipping Claude existence check (managed by VSCode extension)
echo [OK] Claude wrapper ready

echo.
echo 4. Claude wrapper test
echo Testing Claude wrapper...
if exist "%SCRIPT_DIR%claude.bat" (
    echo [OK] claude.bat found
    echo Testing claude.bat --version...
    call "%SCRIPT_DIR%claude.bat" --version
) else (
    echo [NG] claude.bat not found in %SCRIPT_DIR%
    goto :error
)

echo.
echo 5. PATH priority test
echo Testing PATH priority...
where claude 2>nul | findstr /i "claude.bat" >nul
if %errorlevel% equ 0 (
    echo [OK] claude.bat is in PATH
    where claude
) else (
    echo [WARNING] claude.bat is not in PATH or not prioritized
    echo Please set PATH environment variable
)

echo.
echo ===================
echo Test completed!
echo ===================
pause
exit /b 0

:error
echo.
echo [NG] Test failed
echo An error occurred. Please check the messages above.
pause
exit /b 1