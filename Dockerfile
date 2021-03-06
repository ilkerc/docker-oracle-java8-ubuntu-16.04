# Original maintainer Michael Laccetti <michael@laccetti.com> <https://laccetti.com/)
FROM ubuntu:16.04
LABEL MAINTAINER Ilker Cam <cam.ilker@yahoo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8

RUN apt-get update && \
  apt-get install -y --no-install-recommends locales && \
  locale-gen en_US.UTF-8 && \
  apt-get dist-upgrade -y && \
  apt-get --purge remove openjdk* && \
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java-trusty.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 && \
  apt-get install python-software-properties -y && \
  add-apt-repository ppa:webupd8team/java -y && \
  apt-get update && \
  apt-get install -y git curl openssh-client sudo libaio1 libaio-dev && \
  apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
  apt-get clean all && \
  useradd -ms /bin/bash mavenuser