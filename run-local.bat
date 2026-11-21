@echo off
REM Runs n8n with Node.js instead of Docker (for networks that block Docker image downloads).
REM Start the extractor first: double-click ..\invoice-extractor\run.bat
cd /d "%~dp0"
where node >nul 2>&1 || (echo Node.js is not installed. Get it from https://nodejs.org & pause & exit /b 1)
set INVOICE_EXTRACTOR_URL=http://localhost:8000
set N8N_BLOCK_ENV_ACCESS_IN_NODE=false
set GENERIC_TIMEZONE=Asia/Jerusalem
if not exist "%USERPROFILE%\.n8n\imported-invoice-pipeline" (
  echo Importing workflow...
  call npx --yes n8n import:workflow --input=workflows\invoice-pipeline.json && type nul > "%USERPROFILE%\.n8n\imported-invoice-pipeline"
)
echo.
echo Starting n8n at http://localhost:5678 (first run downloads n8n, a few minutes)
start "" cmd /c "timeout /t 20 /nobreak >nul & start http://localhost:5678"
call npx --yes n8n start
pause
