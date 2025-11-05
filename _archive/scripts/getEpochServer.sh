#!/bin/bash
#downloads the epoch server files
git clone https://github.com/EpochModTeam/Epoch.git $STEAMCACHE_DIR/epoch_serv_src
#make the files all lower case for uniformity.
/bin/bash $HOME/source/scripts/makeLowerCase.sh $STEAMCACHE_DIR/epoch_serv_src
cp -r $STEAMCACHE_DIR/epoch_serv_src/server_install_pack/* ${FORCE_INSTALL_DIR}
#rm -r -f /tmp/epoch_serv_src