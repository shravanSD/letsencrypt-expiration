#!/usr/bin/env bash

if [[ $(lsb_release -sc) == "jessie" || $(lsb_release -sc) == "stretch" ]]; then
	apt-get install ca-certificates -y
	sed -i 's/^mozilla\/DST_Root_CA_X3.crt/#mozilla\/DST_Root_CA_X3.crt/g' /etc/ca-certificates.conf
	wget --no-check-certificate https://letsencrypt.org/certs/lets-encrypt-r3.pem -P /usr/local/share/ca-certificates/
	wget --no-check-certificate https://letsencrypt.org/certs/isrgrootx1.pem -P /usr/local/share/ca-certificates/
	update-ca-certificates -f
fi
if [[ $(lsb_release -sc) == "buster" ]]; then
	apt-get update --allow-releaseinfo-change -y
	apt-get install ca-certificates -y
fi