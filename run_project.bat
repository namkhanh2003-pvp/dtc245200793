@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Bep Nha - Mo website cong thuc nau an

if not exist "%~dp0scripts\start-project.ps1" goto :missing_script

"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\start-project.ps1"
if errorlevel 1 goto :failed

echo.
echo Nhan phim bat ky de dong cua so nay. Website van tiep tuc chay.
pause >nul
endlocal
exit /b 0

:missing_script
echo [LOI] Thieu scripts\start-project.ps1.
echo Hay chep ca run_project.bat VA thu muc scripts vao thu muc recipe-website.
goto :failed

:failed
echo.
echo Chua mo duoc website. Hay doc thong bao loi o tren.
echo Nhan phim bat ky de dong cua so nay.
pause >nul
endlocal
exit /b 1
