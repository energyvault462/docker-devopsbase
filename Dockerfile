FROM dan9186/golang:centos7

MAINTAINER Daniel Hess <dan9186@gmail.com>

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y upgrade && \
    yum install -y ack bind-utils bzr cmake curl gcc git make mercurial nmap nmap-ncat \
       nodejs npm python-devel python-pip tar unzip vim wget && \
    yum clean all

WORKDIR /tmp

# Install Packer
RUN wget https://dl.bintray.com/mitchellh/packer/packer_0.8.1_linux_amd64.zip -O packer.zip && \
    unzip packer.zip && \
    rm packer.zip && \
    mv packer* /usr/local/bin/

# Install Terraform
RUN wget https://dl.bintray.com/mitchellh/terraform/terraform_0.6.0_linux_amd64.zip -O terraform.zip && \
    unzip terraform.zip && \
    rm terraform.zip && \
    mv terraform* /usr/local/bin/

# Install etcdctl
RUN wget https://github.com/coreos/etcd/releases/download/v0.4.9/etcd-v0.4.9-linux-amd64.tar.gz -O etcdctl.tar.gz && \
    tar xvf etcdctl.tar.gz && \
    rm etcdctl.tar.gz && \
    mv etcd*/etcdctl /usr/local/bin/ && \
    rm -rf etcd*

# Install fleetctl
RUN wget https://github.com/coreos/fleet/releases/download/v0.11.0/fleet-v0.11.0-linux-amd64.tar.gz -O fleet.tar.gz && \
    tar xvf fleet.tar.gz && \
    rm fleet.tar.gz && \
    mv fleet*/fleetctl /usr/local/bin/ && \
    rm -rf fleet*

# Install kubecfg
RUN wget https://github.com/GoogleCloudPlatform/kubernetes/releases/download/v0.15.0/kubernetes.tar.gz -O kubernetes.tar.gz && \
	tar xvf kubernetes.tar.gz && \
	rm kubernetes.tar.gz && \
	mv kubernetes/platforms/linux/amd64/kubectl /usr/local/bin/ && \
	rm -rf kubernetes*

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
