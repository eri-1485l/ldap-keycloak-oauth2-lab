#!/bin/bash

mkdir -p /var/run/fail2ban
mkdir -p /var/log/keycloak

# Crear el archivo de log si no existe y darle permisos amplios
touch /var/log/keycloak/keycloak.log
chmod 666 /var/log/keycloak/keycloak.log

# Esperar un poco a que Keycloak empiece a escribir
sleep 5

fail2ban-client -x start

# Mantener el contenedor vivo
tail -F /var/log/keycloak/keycloak.log
