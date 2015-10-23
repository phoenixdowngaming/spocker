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

# get and run setup script
RUN gpasswd -a steam tty
USER steam
RUN mkdir ~/spaceengineers
RUN cd ~/spaceengineers
RUN wget -O start.sh https://raw.githubusercontent.com/ArghArgh200/SEDS-Setup/master/start.sh
RUN chmod +x start.sh
 
ENTRYPOINT ["/start.sh"]

