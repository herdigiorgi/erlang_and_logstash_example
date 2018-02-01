#!/bin/bash
set -e

# kibana
service kibana start

# logstash
logstash -f /etc/logstash/conf.d/logstash.conf  \
         --path.settings /etc/logstash/conf.d  &

# elastic search
su - elasticsearch -c /home/elasticsearch/es/elasticsearch-6.1.2/bin/elasticsearch
