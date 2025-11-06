@echo off
REM NeuroScribe Production Launcher for Windows
REM Starts server and opens browser automatically

echo.
echo ====================================
echo    NeuroScribe - Production Launcher
echo ====================================
echo.

set PORT=8080
set URL=http://localhost:%PORT%/NEUROSCRIBE_SIMPLE_WORKING.html

REM Check for Python
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] Found Python
    echo.
    echo Starting server on http://localhost:%PORT%
    echo.
    
    REM Start server in background
    start /min "NeuroScribe Server" cmd /c "python -m http.server %PORT% > nul 2>&1"
    
    REM Wait for server to start
    echo Waiting for server to start...
    timeout /t 3 /nobreak >nul
    
    echo [OK] Server started
    echo.
    echo Opening NeuroScribe...
    echo.
    
    REM Try to open in Chrome app mode, fallback to default browser
    start "" "chrome.exe" --app=%URL% 2>nul || start "" %URL%
    
    echo =========================================
    echo  NeuroScribe is running!
    echo =========================================
    echo.
    echo URL: %URL%
    echo.
    echo To stop the server, close the minimized
    echo "NeuroScribe Server" window
    echo.
    echo Press any key to exit this window...
    pause >nul
    exit /b 0
)

REM No Python found
echo [ERROR] Python not found!
echo.
echo Please install Python from: https://www.python.org/
echo.
echo Or simply double-click NEUROSCRIBE_SIMPLE_WORKING.html
echo to open it directly in your browser!
echo.
pause
exit /b 1
