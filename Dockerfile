# ELK Stack
#
# VERSION               1.0.0

FROM ubuntu
MAINTAINER Will Wright <signup@noimagination.com>

RUN apt-get update --fix-missing && \
    apt-get install wget -y

#
#   Redis
#
RUN apt-get install redis-server -y

#
#   ElasticSearch
#
RUN apt-get install default-jre -y && \
    wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add - && \
    echo deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install elasticsearch -y

#
#   Kibana
#
RUN cd ~; wget https://download.elasticsearch.org/kibana/kibana/kibana-3.0.1.tar.gz && \
    tar xvf kibana-3.0.1.tar.gz && \
    mkdir -p /var/www/html && \
    cp -r kibana-3.0.1/* /var/www/html && \
    rm -rf kibana-3.0.1

#
#   Nginx
#
RUN wget -qO - http://nginx.org/keys/nginx_signing.key | sudo apt-key add - && \
    echo deb http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list && \
    echo deb-src http://nginx.org/packages/ubuntu/ trusty nginx >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install nginx -y

#
#   Logstash
#
RUN echo deb http://packages.elasticsearch.org/logstash/1.4/debian stable main | sudo tee /etc/apt/sources.list.d/logstash.list && \
    apt-get update && \
    apt-get install logstash -y

#
#   Supervisord
#
RUN apt-get install -y supervisor

EXPOSE 80 9200 6379

#
#   Inject config files at the end to optimize build cache
#
ADD etc/default/elasticsearch /etc/default/elasticsearch
ADD etc/init.d/elasticsearch /etc/init.d/elasticsearch
ADD etc/elasticsearch/ /etc/elasticsearch/

ADD etc/redis/redis.conf /etc/redis/redis.conf

ADD etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

ADD etc/logstash/conf.d/central.conf /etc/logstash/conf.d/central.conf

ADD etc/supervisor/conf.d/ /etc/supervisor/conf.d/

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf