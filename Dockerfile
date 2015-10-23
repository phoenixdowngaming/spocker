FROM ubuntu:trusty 

MAINTAINER James S. Moore<james@webtechhq.com>

USER root
RUN apt-get -y update

# install package building helpers
#RUN apt-get -y --force-yes install vim less

# install wine
RUN /usr/bin/add-apt-repository ppa:ubuntu-wine/ppa
RUN apt-get update
RUN apt-get install wine1.7

# install python
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get install python2.7 

# get and run setup script
RUN RUN gpasswd -a steam tty
USER steam
RUN mkdir ~/spaceengineers
RUN cd ~/spaceengineers
RUN wget -O start.sh https://raw.githubusercontent.com/ArghArgh200/SEDS-Setup/master/start.sh
RUN chmod +x start.sh
 
ENTRYPOINT ["/start.sh"]

