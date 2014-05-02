# The Basics
FROM    ubuntu:latest
RUN     apt-get -y update
RUN     apt-get -y install supervisor nginx git wget openjdk-7-jre-headless

# Install Elasticsearch
RUN     cd ~ && wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.1.1.deb
RUN     cd ~ && dpkg -i elasticsearch-1.1.1.deb && rm elasticsearch-1.1.1.deb

# Install Grafana
RUN     git clone https://github.com/grafana/grafana /grafana

# Configure Elasticsearch
ADD     ./elasticsearch/run /usr/local/bin/run_elasticsearch
RUN     chown -R elasticsearch:elasticsearch /var/lib/elasticsearch
RUN     mkdir -p /tmp/elasticsearch && chown elasticsearch:elasticsearch /tmp/elasticsearch

# Configure Grafana
ADD     ./grafana/config.js /grafana/src/config.js

# Configure nginx
RUN     echo "daemon off;" >> /etc/nginx/nginx.conf
ADD     ./nginx/default /etc/nginx/sites-available/default

# Configure supervisord
ADD     ./supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD     ./boot/boot.sh /usr/bin/boot.sh

ENV     GRAPHITE_URL http://graphite.example.com:8080/

EXPOSE  80

CMD     ["/usr/bin/boot.sh"]
