FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y curl

# needed by downtime jobs
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
