ELK stack with Redis input queue, built on Ubuntu base.

Installed Services:

- Redis (2.8.4)
- ElasticSearch (1.3.4)
- Kibana (3.1.0)
- Nginx (1.6.2)
- Logstash (1.4.2)
- Supervisord (3.0b2)

**How to use:**

Ports:
- 80 - Nginx (Kibana)
- 6379 - Redis
- 9200 - ElasticSearch
- 9300 - ElasticSearch

Volumes:
- /var/lib/elasticsearch - ElasticSearch Data
- /var/log - Logs

```
docker run -d -p 80:80 -p 6379:6379 -p 9300:9300 -p 9200:9200 -v /mnt/data/:/var/lib/elasticsearch/ -v /var/log/:/var/log/ wwright/docker-elk
```

**Logstash Source Example**

```
input {
    file {
        path => "/var/log/httpd/access_log"
        start_position => beginning
        type => "apache_access_combined"
    }
}
output {
    redis {
        host => "<elk-stack-goes-here>"
        data_type => "list"
        key => "logstash"
    }
    stdout { codec => rubydebug }
}
```