#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

# --- Load shared variables ---
source "$(dirname "$0")/config.env"
source "$(dirname "$0")/secrets.env"

echo "@ShutdownOnFailedCommand 1" >> /epochSource/epoch.steamScript
echo "@NoPromptForPassword 1" >> /epochSource/epoch.steamScript
echo "@sSteamCmdForcePlatformType windows" >> /epochSource/epoch.steamScript
echo "force_install_dir '$INSTALL_DIR'" >> /epochSource/epoch.steamScript
echo "login '$STEAMid' '$STEAMpass'" >> /epochSource/epoch.steamScript
echo "workshop_download_item 107410 421839251" >> /epochSource/epoch.steamScript
echo "quit" >> /epochSource/epoch.steamScript