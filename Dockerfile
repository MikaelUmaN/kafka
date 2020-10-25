FROM ubuntu:rolling

RUN apt update && apt install -y wget openjdk-11-jre

WORKDIR /opt

ARG KAFKA_VER=2.13-2.6.0
RUN wget https://ftp.acc.umu.se/mirror/apache.org/kafka/2.6.0/kafka_$KAFKA_VER.tgz
RUN tar -xzf kafka_$KAFKA_VER.tgz

WORKDIR /opt/kafka_$KAFKA_VER

