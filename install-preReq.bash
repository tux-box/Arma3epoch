#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

# --- Load shared variables ---
source "$(dirname "$0")/config.env"
source "$(dirname "$0")/secrets.env"

apt-get install nano

useradd -m $ACT