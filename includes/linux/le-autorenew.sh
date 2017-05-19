#!/bin/bash
echo "30 5 * * * /opt/certbot/certbot-auto -n renew --post-hook \"systemctl reload httpd\" >> /root/certbot-log/renew.log" >> /etc/crontab
