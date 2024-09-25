#!/bin/bash
#this is ment to be run directly in linux game server manager docker version. https://hub.docker.com/r/gameservermanagers/gameserver.

${FORCE_INSTALL_DIR}=/data/serverfiles


APP_UPDATE="107410"
WORKSHOP_DOWNLOAD_ITEM="421839251"
MOD_NAME="@epoch"
steamcmd +force_install_dir ${FORCE_INSTALL_DIR} +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${APP_UPDATE} +workshop_download_item 107410 421839251 validate +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="583496184"
MOD_NAME="@CUP Terrains - Core"
${STEAMCMD_DIR}/steamcmd +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="583544987"
MOD_NAME="@CUP Terrains - Maps"
${STEAMCMD_DIR}/steamcmd +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="541888371"
MOD_NAME="@CUP Vehicles"
${STEAMCMD_DIR}/steamcmd +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="450814997"
MOD_NAME="@CBA_A3"
${STEAMCMD_DIR}/steamcmd +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="497660133"
MOD_NAME="@CUP Weapons"
${STEAMCMD_DIR}/steamcmd +login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} +app_update ${DESKTOP_ARMA_ID} +workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} +quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}

DESKTOP_ARMA_ID="107410"
MOD_ID="497661914"
MOD_NAME="@CUP Units"
${STEAMCMD_DIR}/steamcmd \
+login ${STEAM_USER_NAME} ${STEAM_USER_PASSWORD} \
+app_update ${DESKTOP_ARMA_ID} \
+workshop_download_item ${DESKTOP_ARMA_ID} ${MOD_ID} validate \
+quit
echo ---Creating Symbolic link for ${MOD_NAME}----
ln -s  /serverdata/serverfiles/steamapps/workshop/${MOD_ID} ${FORCE_INSTALL_DIR}/${MOD_NAME}
