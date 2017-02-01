#!/bin/bash

curl -XPUT 'http://elk:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
/usr/share/filebeat/bin/filebeat -e -v -c /etc/filebeat/filebeat.yml