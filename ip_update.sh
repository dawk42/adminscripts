#!/bin/bash
set -o nounset
sed -i "s/^(.*) IN A (.*)$/1 IN A $1/" /etc/bind/db.YourDomain
sed -i "s/.*Serial$/ $(date +%Y%m%d%H) ; Serial/" /etc/bind/db.YourDomain
/etc/init.d/bind9 restart
