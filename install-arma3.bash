#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

# --- Load shared variables ---
source "$(dirname "$0")/config.env"
source "$(dirname "$0")/secrets.env"

steamcmd +force_install_dir "$INSTALL_DIR" +login "$STEAMid" "$STEAMpass=" +app_update 107410 +quit
