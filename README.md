ELK stack with Redis input queue, built on Ubuntu base.

Installed Services:
- Redis
- ElasticSearch
- Kibana
- Nginx
- Logstash
- Supervisord

**How to use:**

```
docker run -d --name elk -p 80:80 -p 6379:6379 wwright/docker-elk
```

Port 80 for the Kibana web interface

Port 6379 for Redis

You'll likely want to mount the elasticsearch data directory as a volume for data persistence.

```
docker run -d --name elk -p 80:80 -p 6379:6379 -v /var/lib/elasticsearch:/var/lib/elasticsearch wwright/docker-elk
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