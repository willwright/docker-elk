# MySQL
#
# VERSION               1.0.0

FROM ubuntu
MAINTAINER Will Wright <signup@noimagination.com>

RUN apt-get update
RUN apt-get install default-jre -y
RUN apt-get install wget -y
RUN wget -qO - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
RUN echo deb http://packages.elasticsearch.org/elasticsearch/1.3/debian stable main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install elasticsearch -y

# Heap Size (defaults to 256m min, 1g max)
#ENV ES_HEAP_SIZE 2g

# Heap new generation
#ENV ES_HEAP_NEWSIZE

# max direct memory
#ENV ES_DIRECT_SIZE

# Additional Java OPTS
#ENV ES_JAVA_OPTS

# Maximum number of open files
RUN ulimit -n 65535

# Maximum amount of locked memory
#RUN ulimit -l $MAX_LOCKED_MEMORY

# Maximum number of VMA (Virtual Memory Areas) a process can own
#RUN sysctl -q -w vm.max_map_count=262144

ADD etc/elasticsearch/ /etc/elasticsearch/

#CMD ["/usr/share/elasticsearch/bin/elasticsearch", "-Des.default.config=/etc/elasticsearch/elasticsearch.yml", "-Des.default.path.home=/usr/share/elasticsearch", "-Des.default.path.logs=/var/log/elasticsearch", "-Des.default.path.data=/var/lib/elasticsearch", "-Des.default.path.conf=/etc/elasticsearch"]
CMD /usr/share/elasticsearch/bin/elasticsearch -Des.default.config=/etc/elasticsearch/elasticsearch.yml -Des.default.path.home=/usr/share/elasticsearch -Des.default.path.logs=/var/log/elasticsearch -Des.default.path.data=/var/lib/elasticsearch -Des.default.path.conf=/etc/elasticsearch