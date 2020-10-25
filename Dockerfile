FROM ubuntu:rolling

RUN apt update && apt install -y \
    curl \
    openjdk-11-jre \
    gpg

WORKDIR /opt

ARG KAFKA_VER=2.6.0
ARG SCALA_VER=2.13

RUN curl -SL https://downloads.apache.org/kafka/$KAFKA_VER/kafka_$SCALA_VER-$KAFKA_VER.tgz.asc > kafka_$SCALA_VER-$KAFKA_VER.tgz.asc
RUN curl -SL https://ftp.acc.umu.se/mirror/apache.org/kafka/$KAFKA_VER/kafka_$SCALA_VER-$KAFKA_VER.tgz > kafka_$SCALA_VER-$KAFKA_VER.tgz

RUN curl -SL https://downloads.apache.org/kafka/KEYS > KEYS
RUN gpg --import KEYS
RUN gpg --verify kafka_$SCALA_VER-$KAFKA_VER.tgz.asc kafka_$SCALA_VER-$KAFKA_VER.tgz

RUN tar -xzf kafka_$SCALA_VER-$KAFKA_VER.tgz

WORKDIR /opt/kafka_$SCALA_VER-$KAFKA_VER

