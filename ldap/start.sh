#!/bin/bash
set -e

# Crear directorios que fail2ban necesita
mkdir -p /var/run/fail2ban
mkdir -p /var/log/slapd
touch /var/log/slapd/slapd.log

# Rate limiting en el puerto 636 (LDAPS)
iptables -A INPUT -p tcp --dport 636 -m conntrack --ctstate NEW \
    -m recent --set --name LDAPTLS
iptables -A INPUT -p tcp --dport 636 -m conntrack --ctstate NEW \
    -m recent --update --seconds 60 --hitcount 10 --name LDAPTLS -j DROP

# Arrancar Fail2Ban
fail2ban-client -x start

# Arrancar OpenLDAP
exec /container/tool/run --copy-service
