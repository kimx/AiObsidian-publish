@echo off
setlocal

set "publishRepo=%~dp0"
if "%publishRepo:~-1%"=="\" set "publishRepo=%publishRepo:~0,-1%"

pushd "E:\GitHub\AiObsidian" || exit /b 1
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Export-ObsidianPublish.ps1" -Clean
set "exitCode=%ERRORLEVEL%"
popd

if not "%exitCode%"=="0" exit /b %exitCode%

pushd "%publishRepo%" || exit /b 1

set "hasChanges="
for /f %%i in ('git status --porcelain') do set "hasChanges=1"

if not defined hasChanges (
  echo No changes to publish.
  popd
  exit /b 0
)

git add -A
if errorlevel 1 (
  set "exitCode=%ERRORLEVEL%"
  popd
  exit /b %exitCode%
)

git commit -m "Publish Obsidian notes"
if errorlevel 1 (
  set "exitCode=%ERRORLEVEL%"
  popd
  exit /b %exitCode%
)

git push
set "exitCode=%ERRORLEVEL%"
popd

exit /b %exitCode%
