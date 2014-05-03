Docker image of Grafana
-----------------------

This image contains a standalone instance of Grafana (with ElasticSearch for
persistance)

There are a few Dockerfiles out there for an all-in-one statsd/graphite/grafana
install, but this isn't handy if you already have graphite going, or are using
Hosted Graphite, and just want to setup Grafana separately.

The image has one customizable setting, GRAPHITE_URL, which can be specified via
a Docker environment variable.

Also it exposes one port, 80.

You can run it from the Docker Index, e.g.

docker run -d -p 80:80 --name grafana -e GRAPHITE_URL=https://www.hostedgraphite.com/myId/myApiKey/graphite keeth/grafana
