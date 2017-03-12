#!/bin/bash
pki_dir="/etc/icinga2/pki"


apt-get update
apt-get install -y icinga2 monitoring-plugins monitoring-plugins-basic monitoring-plugins-common monitoring-plugins-standard
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "icinga2 installed, configuring system.."

echo "$MASTER_IP $MASTER_HOST" >>/etc/hosts
echo "127.0.2.1 $CLIENT_HOST" >>/etc/hosts


chown nagios.nagios /etc/icinga2 -R

rm -rf /etc/icinga2/conf.d/*

sed -i "const NodeName = \"localhost\"/const NodeName = \"$CLIENT_HOST\"" /etc/icinga2/constants.conf

icinga2 pki new-cert --cn $CLIENT_HOST --key $pki_dir/$CLIENT_HOST.key --cert $pki_dir/$CLIENT_HOST.crt
icinga2 pki save-cert --key $pki_dir/$CLIENT_HOST.key --cert $pki_dir/$CLIENT_HOST.crt --trustedcert $pki_dir/trusted-cert.crt --host $MASTER_HOST
icinga2 node setup --ticket $ICINGA_TICKET --zone $CLIENT_HOST --master_host $MASTER_HOST  --trustedcert  $pki_dir/trusted-cert.crt  --cn $CLIENT_HOST  --endpoint $MASTER_HOST --accept-commands --accept-config


sed -i '$ i object Zone "global-templates" { global = true }' /etc/icinga2/zones.conf




