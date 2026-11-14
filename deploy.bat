@echo off
rem Copies the site in .\www to the go2rtc web root share on the Pi.
setlocal
set "SRC=%~dp0www"
set "DEST=\\securitypi\www"

robocopy "%SRC%" "%DEST%" /E /NJH /NP /R:2 /W:2
if %ERRORLEVEL% GEQ 8 (
  echo.
  echo Deploy FAILED ^(robocopy exit code %ERRORLEVEL%^).
  exit /b 1
)
echo.
echo Deployed to %DEST%
exit /b 0
