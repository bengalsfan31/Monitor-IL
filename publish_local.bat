@echo off
REM publish_local.bat
REM
REM Fallback path if GitHub Actions' cloud IP gets blocked by MaxPreps'
REM bot protection: run the monitor from YOUR computer (same IP that
REM already works when you run the script normally), then push the
REM regenerated docs/index.html to GitHub so Pages picks it up.
REM
REM Set this up once in Windows Task Scheduler to run every 30 minutes:
REM   Action: Start a program
REM   Program: C:\path\to\publish_local.bat
REM
REM Requires: this .bat sits in the root of your cloned repo folder,
REM and you've already run `git remote add origin ...` / one manual push.

cd /d "%~dp0\.."

python monitor_indian_land.py --once --no-open ^
  --html docs\index.html ^
  --state state\indian_land_state.json ^
  --log state\indian_land_monitor.log ^
  --refresh-minutes 30

git add docs\index.html state\indian_land_state.json
git diff --cached --quiet
if %errorlevel% neq 0 (
  git commit -m "Update dashboard (local run)"
  git push
) else (
  echo No changes to commit.
)
