######## INSTALL ########

# Set the base image
FROM tuxbox1/steamcmd:latest

# Set environment variables
ENV USER steam
ENV HOME /home/steam

# Set working directory
WORKDIR $HOME

#todo
#setup local system
#copy scripts to local system using git, do they exist?
#

ENV STEAMCMD_DIR=/home/steam/cache
ENV STEAM_CMD_USERNAME=anonymous
ENV STEAM_CMD_PASSWRD=anonymous
ENV FORCE_INSTALL_DIR=/home/steam/a3epoch

RUN git clone https://github.com/tux-box/Arma3epoch.git /home/steam/scripts