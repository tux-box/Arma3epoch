#!/bin/bash
#Read a csv and install the mods listed.
APP_UPDATE="107410"

while IFS=';' read -r mod_ID mod_Name; do
 steamcmd \
 +@sSteamCmdForcePlatformType windows \
 +login ${STEAM_CMD_USERNAME} ${STEAM_CMD_PASSWRD} \
 +app_update ${APP_UPDATE} \
 +workshop_download_item ${APP_UPDATE} ${MOD_ID} validate \
 +quit
 echo ---Creating Symbolic link for ${MOD_NAME}----
 ln -s  ${STEAMCMD_DIR}/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}
done < modlist.csv

