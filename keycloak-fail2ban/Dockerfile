FROM alpine:3.20

RUN apk add --no-cache fail2ban iptables ip6tables bash

COPY jail.local /etc/fail2ban/jail.local
COPY filter.d/ /etc/fail2ban/filter.d/
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
