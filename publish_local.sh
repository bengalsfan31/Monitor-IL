#!/usr/bin/env bash
# publish_local.sh
#
# Fallback path if GitHub Actions' cloud IP gets blocked by MaxPreps' bot
# protection: run the monitor from YOUR computer (same IP that already
# works when you run the script normally), then push the regenerated
# docs/index.html to GitHub so Pages picks it up.
#
# Set this up once with cron to run every 30 minutes:
#   crontab -e
#   */30 * * * * /path/to/repo/deploy/publish_local.sh >> /path/to/repo/state/cron.log 2>&1
#
# Requires: this script sits in <repo>/deploy/, and you've already done
# one manual `git push` so the remote/branch are configured.

set -euo pipefail
cd "$(dirname "$0")/.."

python3 monitor_indian_land.py --once --no-open \
  --html docs/index.html \
  --state state/indian_land_state.json \
  --log state/indian_land_monitor.log \
  --refresh-minutes 30

git add docs/index.html state/indian_land_state.json
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "Update dashboard (local run): $(date -u +'%Y-%m-%d %H:%M UTC')"
  git push
fi
