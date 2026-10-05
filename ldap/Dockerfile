FROM osixia/openldap:1.5.0

# Fix repos Debian 10 (buster) obsoletos: reemplazamos todo sources.list
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until \
    && apt-get update && apt-get install -y \
        fail2ban \
        iptables \
        iproute2 \
    && rm -rf /var/lib/apt/lists/*

COPY fail2ban/jail.local /etc/fail2ban/jail.local
COPY fail2ban/filter.d/ /etc/fail2ban/filter.d/
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 389 636

ENTRYPOINT ["/start.sh"]
