FROM ubuntu:14.04


###############################################################################
#                                INSTALLATION
###############################################################################

### install Filebeat

RUN apt-get update -qq \
 && apt-get install -qqy curl \
 && apt-get clean

RUN curl -L -O https://download.elastic.co/beats/filebeat/filebeat_1.2.3_amd64.deb \
 && dpkg -i filebeat_1.2.3_amd64.deb \
 && rm filebeat_1.2.3_amd64.deb

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
