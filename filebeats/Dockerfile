FROM ubuntu:14.04
MAINTAINER Will Wright <signup@noimagination.com>

###############################################################################
#                                INSTALLATION
###############################################################################

### install Filebeat

RUN apt-get update -qq \
 && apt-get install -qqy curl \
 && apt-get clean

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.2-amd64.deb \
 && dpkg -i filebeat-5.0.2-amd64.deb \
 && rm filebeat-5.0.2-amd64.deb

###############################################################################
#                                CONFIGURATION
###############################################################################

### configure Filebeat

# config file
COPY filebeat.yml /etc/filebeat/filebeat.yml

###############################################################################
#                                    START
###############################################################################

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]
