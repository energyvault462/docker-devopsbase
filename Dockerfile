FROM dan9186/golang

MAINTAINER Daniel Hess <dan9186@gmail.com>

RUN yum -y install epel-release && \
    yum -y update && \
    yum -y upgrade && \
    yum install -y ack bind-utils bzr curl gcc git make mercurial nmap nmap-ncat \
       nodejs python-devel python-pip tar unzip vim wget && \
    yum clean all

WORKDIR /tmp

# Install Packer
RUN wget https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip -O packer.zip && \
    unzip packer.zip && \
    rm packer.zip && \
    mv packer* /usr/local/bin/

# Install Terraform
RUN wget https://dl.bintray.com/mitchellh/terraform/terraform_0.4.2_linux_amd64.zip -O terraform.zip && \
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
RUN wget https://github.com/coreos/fleet/releases/download/v0.10.0/fleet-v0.10.0-linux-amd64.tar.gz -O fleet.tar.gz && \
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

WORKDIR /
