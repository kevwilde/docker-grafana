Docker image of Grafana
-----------------------

This image contains a sensible default configuration of Grafana


### Using the Docker Index ###

This image is published on index.docker.io. The container exposes the following ports:

- `80`: the Grafana web interface.

To start a container with this image you just need to run the following command:

```bash
docker run -d -p 80:80 --name grafana keeth/grafana
```
