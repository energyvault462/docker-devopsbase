FROM dan9186/golang

# Install tools
RUN yum update -y \
    && yum -y install vim wget unzip \
    && yum -y clean all

# Install Packer
RUN cd /tmp \
    && wget https://dl.bintray.com/mitchellh/packer/packer_0.7.1_linux_amd64.zip -O packer.zip \
    && unzip packer.zip \
    && mv packer* /usr/local/bin/

# TODO: Add terraform install
# TODO: Add ansible install
# TODO: Add etcdctl install
# TODO: Add fleetctl install
