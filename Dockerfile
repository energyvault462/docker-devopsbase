FROM gomicro/golang:centos7

MAINTAINER Brent Johnson <brentj433@gmail.com>

ARG BUILD_DATE
ARG BUILD_NUMBER
ARG VERSION

LABEL org.metadata.build-date=$BUILD_DATE \
	   org.metadata.version=$VERSION.$BUILD_NUMBER \
	   org.metadata.name="" \
	   org.metadata.description="" \
	   org.metadata.url="https://github.com/energyvault462/docker-devopsbase" \
	   org.metadata.vcs-url="https://github.com/energyvault462/docker-devopsbase"

# Add repos
#RUN rpm -Uvh https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm


# Install Packages
RUN yum -y install epel-release && \
    yum -y update && \
    yum -y upgrade && \
    yum install -y \
					ack autoconf automake \
					bind-utils bison bzip2 bzr \
					cmake curl \
					file-devel \
					jq \
					libcurl-devel libffi-devel libicu-devel libpqxx-devel libtool libxml2-devel libxslt-devel libyaml-devel libtool-ltdl-devel \
					gcc-c++ git \
					make man maven mercurial \
					nmap nmap-ncat nodejs npm net-tools \
					patch postgresql95-devel postgresql-devel python-devel python-pip \
					readline-devel \
					sqlite-devel \
					tar \
					unzip \
					vim \
					wget \
					xmlsec1-openssl-devel \
					&& \
    yum clean all

WORKDIR /tmp

# Upgrade Pip
RUN pip install --upgrade pip

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
    wget https://github.com/rvm/rvm/archive/1.27.0.tar.gz && \
    tar xvf 1.27.0.tar.gz && \
    cd rvm-1.27.0 && \
    ./install && \
    cd /tmp && \
    rm -rf 1.27.0.tar.gz rvm-1.27.0 && \
    echo "bundler" >> /usr/local/rvm/gemsets/global.gems

# Install Packer
RUN wget https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip -O packer.zip && \
    unzip packer.zip && \
    rm packer.zip && \
    mv packer* /usr/local/bin/

# Install Python Items
RUN pip install awscli

# Install NPM Items
RUN npm install -g bower ember-cli grunt-cli less

# Add custom binaries
ADD ext/cqlsh /usr/bin/cqlsh

WORKDIR /
