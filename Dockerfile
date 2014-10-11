FROM dan9186/golang

MAINTAINER dan9186

# Add EPEL repo
RUN cd /tmp \
    && wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && rpm -Uvh epel-release-6*.rpm
    && rm epel-release-6*.rpm

# Install tools available via yum
RUN yum update -y \
    && yum -y install vim wget unzip \
    && yum -y clean all

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

# TODO: Add ansible install
# TODO: Add etcdctl install
# TODO: Add fleetctl install
