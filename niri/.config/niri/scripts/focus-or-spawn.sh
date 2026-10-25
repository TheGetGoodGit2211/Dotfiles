#!/usr/bin/env bash

# Usage: focus-or-spawn.sh <app-id> <command-to-run>

APP_ID="$1"
CMD="$2"

if [ -z "$APP_ID" ] || [ -z "$CMD" ]; then
    echo "Usage: focus-or-spawn.sh <app-id> <exec_cmd>"
    exit 1
fi

# Find the exact matching window ID using jq (regex exact match or fallback string comparison)
WINDOW_ID=$(niri msg -j windows | jq -r --arg app "$APP_ID" '.[] | select(.app_id | test("^" + $app + "$"; "i")) | .id' | head -n 1)

if [ -n "$WINDOW_ID" ] && [ "$WINDOW_ID" != "null" ]; then
    # Focus the existing window
    niri msg action focus-window --id "$WINDOW_ID"
else
    # Spawn the app once safely
    nohup $CMD >/dev/null 2>&1 &
    disown
fi
