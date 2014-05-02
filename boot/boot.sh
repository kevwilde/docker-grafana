#!/bin/bash
sed "s,GRAPHITE_URL,$GRAPHITE_URL," -i /grafana/src/config.js
exec /usr/bin/supervisord
