#!/bin/bash

#echo "$MASTER_IP $MASTER_HOST" >>/etc/hosts

curl -k -s -u tg-icinga2-client-ticket:asejkgh43734asuygsaa -H 'Accept: application/json' \
 -X POST 'https://$MASTER_HOST:5665/v1/actions/generate-ticket' -d '{ "cn": "CLIENT_IP"}'
