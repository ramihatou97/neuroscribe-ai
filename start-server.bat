@echo off
REM NeuroScribe Server Launcher for Windows
REM Automatically detects and starts the best available HTTP server

echo.
echo ====================================
echo    NeuroScribe - Server Launcher
echo ====================================
echo.

set PORT=8080

REM Try Python 3
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] Found Python
    echo.
    echo Starting server on http://localhost:%PORT%
    echo.
    echo Open this URL in your browser:
    echo    http://localhost:%PORT%/NEUROSCRIBE_SIMPLE_WORKING.html
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    python -m http.server %PORT%
    exit /b 0
)

REM Try PHP
where php >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] Found PHP
    echo.
    echo Starting server on http://localhost:%PORT%
    echo.
    echo Open this URL in your browser:
    echo    http://localhost:%PORT%/NEUROSCRIBE_SIMPLE_WORKING.html
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    php -S localhost:%PORT%
    exit /b 0
)

REM Try Node.js with npx
where npx >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] Found Node.js
    echo.
    echo Starting server on http://localhost:%PORT%
    echo.
    echo Open this URL in your browser:
    echo    http://localhost:%PORT%/NEUROSCRIBE_SIMPLE_WORKING.html
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    npx http-server -p %PORT%
    exit /b 0
)

REM No server found
echo [ERROR] No HTTP server found!
echo.
echo Please install one of the following:
echo   * Python 3: https://www.python.org/downloads/
echo   * Node.js: https://nodejs.org/
echo   * PHP: https://www.php.net/
echo.
echo Or simply double-click NEUROSCRIBE_SIMPLE_WORKING.html to open it directly!
echo.
pause
exit /b 1
