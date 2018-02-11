FROM debian:jessie-backports

RUN apt-get update \
  && apt-get install -y letsencrypt -t jessie-backports \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /etc/letsencrypt \
  && mkdir -p /var/www/letsencrypt \
  && apt-get update \
  && apt-get install -y --no-install-recommends cron

VOLUME ["/etc/cron.d", "/var/www/letsencrypt", "/etc/letsencrypt"]

CMD ["cron", "-f"]
