@echo off
setlocal

cd /d "%~dp0"
if errorlevel 1 exit /b 1

set "message=Update files"
if not "%~1"=="" set "message=%*"

git add -A
if errorlevel 1 exit /b 1

git diff --cached --quiet
if errorlevel 2 exit /b 1

if errorlevel 1 (
    git commit -m "%message%"
    if errorlevel 1 exit /b 1
) else (
    echo No changes to commit.
)

for /f "delims=" %%b in ('git branch --show-current') do set "branch=%%b"
if not defined branch exit /b 1

git push -u origin "%branch%"
if errorlevel 1 exit /b 1