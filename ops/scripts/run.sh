#!/bin/bash
set -e

#
# INSTALLING
#

# fetches debian dependencies
apt-get update
apt-get install -y curl openjdk-8.jdk wget net-tools \
        apt-utils apt-transport-https gnupg2

# installs Elastic Search
useradd elasticsearch || true # elastic search need a non root user 
mkdir -p /home/elasticsearch/es/
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.2.tar.gz
tar -xvf elasticsearch-6.1.2.tar.gz
cp -r elasticsearch-6.1.2 /home/elasticsearch/es/
cp  elasticsearch.yml \
    /home/elasticsearch/es/elasticsearch-6.1.2/config/elasticsearch.yml
chown -R elasticsearch /home/elasticsearch/*

# installs kivana
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update
apt-get install -y kibana
cp kibana.yml /etc/kibana/kibana.yml

# installs logstash
wget https://artifacts.elastic.co/downloads/logstash/logstash-6.1.3.deb
dpkg -i logstash-6.1.3.deb
ln -s /usr/share/logstash/bin/logstash /usr/local/bin/logstash
cp logstash.conf /etc/logstash/conf.d
cp logstash.yml /etc/logstash/conf.d


#
# RUNS EVERYTHING
#

# starts elastic search
su - elasticsearch -c /home/elasticsearch/es/elasticsearch-6.1.2/bin/elasticsearch &

# starts logstash
logstash -f /etc/logstash/conf.d/logstash.conf  \
         --path.settings /etc/logstash/conf.d  &

# starts kibana
service kibana start

