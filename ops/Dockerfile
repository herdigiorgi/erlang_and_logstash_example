FROM debian

RUN apt-get update && apt-get install -y curl openjdk-8-jdk wget
ADD scripts /home/elasticsearch/
RUN cd /home/elasticsearch && sh /home/elasticsearch/install.sh

EXPOSE 9200
EXPOSE 5601
EXPOSE 9125

CMD ["bash", "/home/elasticsearch/run.sh"]
