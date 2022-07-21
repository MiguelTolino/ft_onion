#!/bin/bash

HIDDENSERVICENAME="ft_onion"

sed -i '24i listen unix:/var/run/nginx.sock; \n \
		if ($request_method !~ ^(GET|HEAD|POST)$ )\
		{ \
			return 405; \
		}' /etc/nginx/sites-available/default
sed -i '26i PrivateNetwork=yes' /lib/systemd/system/nginx.service
service nginx restart
mv torrc /etc/tor/
service tor restart
sleep 5
ADDRESS=$(cat /var/lib/tor/$HIDDENSERVICENAME/hostname)
sed -i "s/server_name _;/server_name $ADDRESS;/g" /etc/nginx/sites-available/default
service nginx stop
rm -f /var/run/nginx.sock
