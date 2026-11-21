@echo off
cd /d "%~dp0"
if not exist ..\invoice-extractor\.env copy ..\invoice-extractor\.env.example ..\invoice-extractor\.env
echo Stopping the standalone extractor container (if running) to free port 8000...
docker rm -f invoice-extractor >nul 2>&1
echo Starting invoice-extractor + n8n...
docker compose up -d --build || goto :error
echo.
echo Importing workflow...
timeout /t 10 /nobreak >nul
docker compose exec -T n8n n8n import:workflow --input=/workflows/invoice-pipeline.json
echo.
echo n8n:        http://localhost:5678
echo Extractor:  http://localhost:8000
start http://localhost:5678
pause
exit /b 0
:error
echo.
echo Failed. Check the error above: Docker Desktop not running, or a network problem while downloading images (just run this file again).
pause
exit /b 1
