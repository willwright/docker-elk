FROM sebp/elk
MAINTAINER Will Wright <signup@noimagination.com>

RUN chmod -R a+x /opt/elasticsearch/bin /opt/kibana/bin
RUN ls -la /opt/elasticsearch/bin
RUN /opt/elasticsearch/bin/elasticsearch-plugin install x-pack && /opt/kibana/bin/kibana-plugin install x-pack

COPY etc/logstash/conf.d /etc/logstash/conf.d
COPY etc/sysctl.conf /etc/sysctl.conf
COPY etc/default/elasticsearch /etc/default/elasticsearch