#!/bin/bash

echo "$MASTER_IP $MASTER_HOST" >>/etc/hosts

curl -k -s -u tg-icinga2-client-ticket:asejkgh43734asuygsaa -H 'Accept: application/json' -X POST "https://$MASTER_HOST:5665/v1/actions/generate-ticket" -d "{ "cn": "$CLIENT_IP"}"


apt-get update
apt-get install -y icinga2 monitoring-plugins monitoring-plugins-basic monitoring-plugins-common monitoring-plugins-standard
apt-get clean
rm -rf /var/lib/apt/lists/*

