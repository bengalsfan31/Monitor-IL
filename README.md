INDIAN LAND WARRIORS MONITOR — SETUP & RUN INSTRUCTIONS
=========================================================

WHAT THIS IS
------------
A script that checks MaxPreps for the Indian Land Warriors (Fort Mill, SC)
across 7 sports — Football, Basketball, Soccer, Volleyball (Girls),
Volleyball (Boys), Baseball, Softball — and builds an ESPN-style HTML
dashboard (indian_land_dashboard.html) you can open in any browser.


STEP 1 — CHECK PYTHON IS INSTALLED
-----------------------------------
Open a terminal (Command Prompt / PowerShell on Windows, Terminal on
Mac/Linux) and run:

    python3 --version

If that fails on Windows, try:

    python --version

You need Python 3.8 or newer. If it's not installed, download it from
https://www.python.org/downloads/ (on Windows, check the box that says
"Add Python to PATH" during install).


STEP 2 — FIND / PLACE THE SCRIPT
----------------------------------
Make sure monitor_indian_land.py is saved somewhere you can find it —
for example your Downloads folder, or a dedicated folder like:

    Documents/warriors-monitor/monitor_indian_land.py

Keep note of that folder's path — you'll need it in Step 4.


STEP 3 — INSTALL REQUIRED PACKAGES
-------------------------------------
In the terminal, run:

    pip install requests beautifulsoup4 lxml

(Recommended, not required) MaxPreps sometimes blocks plain automated
requests with a 406 error. This extra package helps avoid that:

    pip install cloudscraper

If "pip" isn't recognized, try "pip3" instead.


STEP 4 — GO TO THE SCRIPT'S FOLDER
-------------------------------------
In the terminal, "cd" into the folder where you saved the script.

Windows example:
    cd Downloads

Mac/Linux example:
    cd ~/Downloads

Tip: you can confirm the file is really there first:
    Windows:      dir monitor_indian_land.py
    Mac/Linux:    ls monitor_indian_land.py


STEP 5 — RUN IT
------------------
For a single check that builds the dashboard and opens it in your browser:

    python monitor_indian_land.py --once

(Use "python3" instead of "python" if that's what worked in Step 1.)

To let it run continuously and re-check every 30 minutes, just drop
--once:

    python monitor_indian_land.py

Stop it anytime with Ctrl+C.


OTHER USEFUL OPTIONS
-----------------------
    --interval 15        Check every 15 minutes instead of the default 30
    --no-open             Don't automatically open the dashboard in a browser
    --state FILE.json     Where to save the last-checked data (default:
                           indian_land_state.json)
    --log FILE.log        Where to write the log file (default:
                           indian_land_monitor.log)
    --html FILE.html      Where to write the dashboard (default:
                           indian_land_dashboard.html)
    --no-html             Don't generate an HTML dashboard at all

Example combining a few:

    python monitor_indian_land.py --interval 15 --html warriors.html


TROUBLESHOOTING
-------------------
"No such file or directory" / "can't find file"
    -> You're not in the folder where the script is saved. Repeat Step 4,
       or run it with the full path instead, e.g.:
       python C:\Users\YourName\Downloads\monitor_indian_land.py --once

"ModuleNotFoundError: No module named 'bs4'" (or 'requests', 'lxml')
    -> Re-run Step 3's pip install command.

Getting 406 errors in the log
    -> Install cloudscraper (Step 3, second command) and try again.

"python" not recognized
    -> Try "python3" instead, or reinstall Python and make sure "Add to
       PATH" is checked (Windows).
