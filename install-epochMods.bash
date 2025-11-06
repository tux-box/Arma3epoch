#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

# --- Load shared variables ---
source "$(dirname "$0")/config.env"
source "$(dirname "$0")/secrets.env"

# ================= CONFIGURATION =================
HTML_FILE="epochModList.html"          # Path to your HTML file
STEAMCMD="/usr/games/steamcmd"              # Path to steamcmd
# Steam username and password defined in secrets.env 
# SteamCMD install directory defined in config.env
APP_ID=107410                                # Arma 3 AppID
# =================================================

# Function to clean mod name
clean_name() {
    local name="$1"
    # Remove punctuation, replace spaces with underscores, add @
    echo "@$(echo "$name" | tr -d '[:punct:]' | tr ' ' '_')"
}

# Parse HTML using grep/sed
mods=()
while IFS= read -r line; do
    # Extract display name
    if [[ "$line" =~ \<td\ data-type=\"DisplayName\"\>(.*)\<\/td\> ]]; then
        name="${BASH_REMATCH[1]}"
    fi
    # Extract workshop ID
    if [[ "$line" =~ \<a\ href=\"[^\"]*id=([0-9]+)\" ]]; then
        id="${BASH_REMATCH[1]}"
        mods+=("$id|$name")
    fi
done < "$HTML_FILE"

echo "Found ${#mods[@]} mods in HTML file."

# Download and create symlinks
for mod in "${mods[@]}"; do
    IFS='|' read -r mod_id mod_name <<< "$mod"
    echo -e "\n=== Processing: $mod_name ($mod_id) ==="

    # Download using SteamCMD
    "$STEAMCMD" +force_install_dir "$FORCE_INSTALL_DIR" +login "$STEAM_USER" +workshop_download_item "$APP_ID" "$mod_id" +quit

    mod_folder="$FORCE_INSTALL_DIR/steamapps/workshop/content/$APP_ID/$mod_id"
    if [ ! -d "$mod_folder" ]; then
        echo "⚠️  Mod folder not found for $mod_id. Skipping."
        continue
    fi

    # Create symlink
    link_name="$FORCE_INSTALL_DIR/$(clean_name "$mod_name")"
    if [ -e "$link_name" ]; then
        echo "Skipping existing link: $link_name"
        continue
    fi

    ln -s "$mod_folder" "$link_name"
    echo "✅ Created symlink: $link_name -> $mod_folder"
done

echo -e "\nAll mods processed successfully."