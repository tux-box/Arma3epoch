######## INSTALL ########

# Set the base image
FROM tuxbox1/steamcmd:latest

# Set environment variables
ENV USER=steam
ENV HOME=/home/steam

# Set working directory
WORKDIR $HOME

#todo
#setup local system
#copy scripts to local system using git, do they exist?
#

RUN mkdir ~/cache
RUN mkdir ~/scripts
RUN mkdir ~/a3epoch

ENV STEAMCMD_DIR=/home/steam/cache
ENV STEAM_CMD_USERNAME=anonymous
ENV STEAM_CMD_PASSWRD=anonymous
ENV FORCE_INSTALL_DIR=/home/steam/a3epoch

RUN git clone https://github.com/tux-box/Arma3epoch.git /home/steam/scripts
RUN find /home/steam/scripts -type f -exec chmod +x {} \;
RUN chmod +x -R /home/steam/scripts

RUN !/bin/bash /home/steam/scripts/workshopScripts/installModsByCSV.sh
RUN ls -la /home/steam