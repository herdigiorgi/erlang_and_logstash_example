#!/bin/bash

docker image build -f test-install-dockerfile . \
       --tag test-install-docker-ekl
docker run test-install-docker-ekl \
       -p "9200:9200" \
       -p "5601:5601" \
       -p "9125:9125/udp"
