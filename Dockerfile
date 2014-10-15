FROM dan9186/golang

MAINTAINER dan9186

# Add EPEL repo
ADD ext/epel-release-6-8.noarch.rpm /tmp/epel-release-6-8.noarch.rpm
RUN cd /tmp \
    && rpm -Uvh epel-release-6-8.noarch.rpm \
    && rm epel-release-6-8.noarch.rpm

# Install tools available via yum
RUN yum update -y \
    && yum -y install ack bind-utils make unzip vim wget \
    && yum clean all

# Install Packer
RUN cd /tmp \
    && wget https://dl.bintray.com/mitchellh/packer/packer_0.7.1_linux_amd64.zip -O packer.zip \
    && unzip packer.zip \
    && rm packer.zip \
    && mv packer* /usr/local/bin/

# Install Terraform
RUN cd /tmp \
    && wget https://dl.bintray.com/mitchellh/terraform/terraform_0.2.2_linux_amd64.zip -O terraform.zip \
    && unzip terraform.zip \
    && rm terraform.zip \
    && mv terraform* /usr/local/bin/

# Install etcdctl
RUN cd /tmp \
    && wget https://github.com/coreos/etcd/releases/download/v0.4.5/etcd-v0.4.5-linux-amd64.tar.gz -O etcdctl.tar.gz \
    && tar xvf etcdctl.tar.gz \
    && rm etcdctl.tar.gz \
    && mv etcd*/etcdctl /usr/local/bin/
    && rm -rf etcd*

# Install fleetctl
RUN cd /tmp \
    && wget https://github.com/coreos/fleet/releases/download/v0.8.3/fleet-v0.8.3-linux-amd64.tar.gz -O fleet.tar.gz \
    && tar xvf fleet.tar.gz \
    && rm fleet.tar.gz \
    && mv fleet*/fleetctl /usr/local/bin/
    && rm -rf fleet*

# Install kubecfg
# TODO: Build from source
ADD ext/kubecfg /usr/local/bin/ 
