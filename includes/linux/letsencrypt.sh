#!/bin/bash
fqdn=$1;
/opt/certbot/certbot-auto certonly --standalone --email support@softbase.dk --agree-tos -d $fqdn
