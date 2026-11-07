@echo off
rem Opens the Medianta page through a local web server, so every script (animations, diagrams, the phone menu) runs.
rem A page opened by double-clicking index.html is a file:// page, and the browser blocks its module scripts.
cd /d "%~dp0"
where python >nul 2>nul
if %errorlevel%==0 (
  start "Medianta server" /min python -m http.server 8080 --bind 127.0.0.1
) else (
  start "Medianta server" /min cmd /c npx --yes serve -l 8080 .
)
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:8080/index.html"
