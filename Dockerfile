######## INSTALL ########

# Set the base image
FROM tuxbox1/steamcmd:latest

# Set environment variables
ENV USER=steam
ENV HOME=/home/steam

# Set working directory
WORKDIR $HOME

RUN mkdir $HOME/cache
RUN mkdir $HOME/scripts
RUN mkdir $HOME/a3epoch

ENV STEAM_CMD_USERNAME=anonymous
ENV STEAM_CMD_PASSWRD=anonymous

ENV STEAMCACHE_DIR=$HOME/cache
ENV FORCE_INSTALL_DIR=$HOME/a3epoch
ENV STEAM_CACHE=$HOME/cache
#ENV STEAMCMD_DIR=
ENV SOURCE=$HOME/source

RUN git clone https://github.com/tux-box/Arma3epoch.git $HOME/source
RUN find $HOME/source/scripts -type f -exec chmod +x {} \;
#RUN chmod +x -R $HOME/source/scripts

RUN !/bin/bash $HOME/source/scripts/steam/installModsByCSV.sh
RUN ls -la /home/steam