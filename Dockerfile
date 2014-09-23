# ELK Stack
#
# VERSION               1.0.0

FROM ubuntu
MAINTAINER Will Wright <signup@noimagination.com>

RUN apt-get update --fix-missing
RUN apt-get install wget -y

#
#   Redis
#
RUN apt-get install redis-server -y

#
#   ElasticSearch
#
RUN apt-get install default-jre -y
RUN wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install elasticsearch -y

ADD etc/default/elasticsearch /etc/default/elasticsearch
ADD etc/init.d/elasticsearch /etc/init.d/elasticsearch
ADD etc/elasticsearch/ /etc/elasticsearch/

#
#   Kibana
#
RUN cd ~; wget https://download.elasticsearch.org/kibana/kibana/kibana-3.0.1.tar.gz
RUN tar xvf kibana-3.0.1.tar.gz
RUN mkdir -p /var/www/html
RUN cp -r kibana-3.0.1/* /var/www/html
RUN rm -rf kibana-3.0.1

#
#   Nginx
#
RUN wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
RUN echo deb http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list
RUN echo deb-src http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install nginx -y
ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

#
#   Logstash
#
RUN echo deb http://packages.elasticsearch.org/logstash/1.4/debian stable main | sudo tee /etc/apt/sources.list.d/logstash.list
RUN apt-get update
RUN apt-get install logstash -y
ADD etc/logstash/conf.d/central.conf /etc/logstash/conf.d/central.conf

#
#   Supervisord
#
RUN apt-get install -y supervisor
ADD etc/supervisor/conf.d/ /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf