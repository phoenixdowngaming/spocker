FROM ubuntu:trusty 

MAINTAINER James S. Moore<james@webtechhq.com>

USER root
RUN apt-get -yq update

# install package building helpers
RUN apt-get -yq --force-yes install vim less python-software-properties software-properties-common

# install wine
RUN add-apt-repository ppa:ubuntu-wine/ppa
#wine needs i386 libs
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -yq install wine1.7 winetricks xvfb

# install python
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get -yq install python2.7
RUN apt-get -yq install screen byobu

# get and run setup script
RUN useradd -m -s /bin/bash steam
RUN usermod -a -G video,audio,tty steam
RUN mkdir -p /home/steam/steamcmd
RUN mkdir /home/steam/spaceengineers
#RUN gpasswd -a steam tty
# RUN wget https://raw.githubusercontent.com/ArghArgh200/SEDS-Setup/master/start.sh
ADD start.sh /home/steam/spaceengineers/start.sh
ADD run.sh /home/steam/spaceengineers/run.sh
RUN chmod +x  /home/steam/spaceengineers/start.sh
RUN chmod +x  /home/steam/spaceengineers/run.sh
RUN chown -R steam. /home/steam
WORKDIR /home/steam/spaceengineers
USER steam

ENTRYPOINT ["/home/steam/spaceengineers/run.sh"]

