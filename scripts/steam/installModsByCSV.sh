#!/bin/bash
#Read a csv and install the mods listed.
WORKSHOP_ID="107410"

while IFS=';' read -r MOD_ID MOD_NAME; do
  # Skip the header line (optional, depending on your needs)
  if [[ "$MOD_ID" == "MOD_ID" ]]; then
    continue
  fi
 printf "\n"
 steamcmd \
 +@sSteamCmdForcePlatformType windows \
 +login ${STEAM_CMD_USERNAME} ${STEAM_CMD_PASSWRD} \
 +app_update ${WORKSHOP_ID} \
 +workshop_download_item ${WORKSHOP_ID} ${MOD_ID} validate \
 +quit
 echo ---Creating Symbolic link for $MOD_NAME
 ln -s  ${STEAM_CACHE}/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}
 printf "\n"
done < $HOME/source/scripts/steam/modlist.csv
