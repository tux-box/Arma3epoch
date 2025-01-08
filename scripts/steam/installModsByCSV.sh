#!/bin/bash
#Read a csv and install the mods listed.
WORKSHOP_ID="107410"

while IFS=';' read -r mod_ID mod_Name; do
 steamcmd \
 +@sSteamCmdForcePlatformType windows \
 +login ${STEAM_CMD_USERNAME} ${STEAM_CMD_PASSWRD} \
 +app_update ${WORKSHOP_ID} \
 +workshop_download_item ${APP_UPDATE} ${MOD_ID} validate \
 +quit
 echo ---Creating Symbolic link for ${MOD_NAME}----
 ln -s  ${STEAM_CACHE}/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}
 Echo ""
 Echo ""
done < $HOME/scripts/workshopScripts/modlist.csv