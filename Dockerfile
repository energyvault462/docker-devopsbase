FROM dan9186/golang

# Install tools
RUN yum update -y \
    && yum -y install vim wget unzip \
    && yum -y clean all

# TODO: Add packer install
# TODO: Add terraform install
# TODO: Add ansible install
# TODO: Add etcdctl install
# TODO: Add fleetctl install
