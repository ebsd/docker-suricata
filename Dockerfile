FROM alpine:latest
LABEL maintainer='ebsd@itstiptop.net'

# Install packages
RUN apk -U upgrade 
RUN apk add suricata --no-cache
# Install Suricata-update utility https://github.com/OISF/suricata-update
RUN apk add python3 py3-pip
RUN pip install suricata-update
COPY suricata-update.sh /etc/suricata/suricata-update.sh
# COPY file needed for the Suricata efficiency
COPY suricata-update-cron /etc/crontabs/suricata-update-cron
RUN chmod +x /etc/crontabs/suricata-update-cron
COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod +x /tmp/docker-entrypoint.sh
#COPY suricata.yaml /etc/suricata/suricata.yaml
# Forwarding suricata application logs to stdout
# RUN ln -sf /dev/stdout /var/log/suricata/suricata.log
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
