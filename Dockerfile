FROM ubuntu:20.04


RUN apt-get update -y && apt-get install -y curl

# https://serverfault.com/a/1044731
## preesed tzdata, update package index, upgrade packages and install needed software
RUN truncate -s0 /tmp/preseed.cfg && \
       (echo "tzdata tzdata/Areas select Europe" >> /tmp/preseed.cfg) && \
       (echo "tzdata tzdata/Zones/Europe select Vienna" >> /tmp/preseed.cfg) && \
       debconf-set-selections /tmp/preseed.cfg && \
       rm -f /etc/timezone /etc/localtime && \
       apt-get update && \
       DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
       apt-get install -y tzdata
## cleanup of files from setup
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
