#!/bin/bash
domain=$1
set -o nounset
sed -i "s/^(.*) IN A (.*)$/1 IN A $1/" /etc/bind/db.$domain
sed -i "s/.*Serial$/ $(date +%Y%m%d%H) ; Serial/" /etc/bind/db.$domain
/etc/init.d/bind9 restart
