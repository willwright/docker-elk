ELK stack with Redis input queue, built on Ubuntu base.

Installed Services:
* Redis
* ElasticSearch
* Kibana
* Nginx
* Logstash
* Supervisord

**How to use:**

`docker run -d --name my-elk -p 80:80 -p 9200:9200 -p 6397:6379 wwright/elk`

Port 80 for the Kibana web interface

Port 9200 for elasticsearch

Port 6379 for Redis

You'll likely want to mount the elasticsearch data directory as a volume for data persistence.

`docker run -d --name my-elk -p 80:80 -p 9200:9200 -p 6397:6379 -v var/lib/elasticsearch:/var/lib/elasticsearch wwright/elk`