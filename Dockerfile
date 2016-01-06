FROM dan9186/golang:centos7

MAINTAINER Daniel Hess <dan9186@gmail.com>

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y upgrade && \
    yum install -y ack bind-utils bzr cmake curl gcc git make mercurial nmap nmap-ncat \
       nodejs npm python-devel python-pip tar unzip vim wget \
       libxml2-devel libxslt-devel xmlsec1-openssl-devel libtool-ltdl-devel net-tools && \
    yum clean all

WORKDIR /tmp

# Install Packer
RUN wget https://dl.bintray.com/mitchellh/packer/packer_0.8.6_linux_amd64.zip -O packer.zip && \
    unzip packer.zip && \
    rm packer.zip && \
    mv packer* /usr/local/bin/

# Install RVM
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
    curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install Grunt
RUN npm install -g grunt-cli

# Install Ember
RUN npm install -g ember-cli

# Install Bower
RUN npm install -g bower

# Install Less
RUN npm install -g less

WORKDIR /
