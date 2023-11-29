FROM centos:8

# update yum.repos
RUN rename '.repo' '.repo.bak' /etc/yum.repos.d/*.repo \
        && curl http://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -o /etc/yum.repos.d/Centos-vault-8.5.2111.repo \
        && curl http://mirrors.aliyun.com/repo/epel-archive-8.repo -o /etc/yum.repos.d/epel-archive-8.repo \
        && yum clean all && yum makecache

# install dependencies
RUN yum install -y cmake git patch libxml2-devel bzip2-devel clang openssl-devel xz-devel python39

# libbz2 zlib1g-dev 

WORKDIR /osxcross-docker

# install osxcross
RUN git clone https://github.com/tpoechtrager/osxcross.git

# install convenient tools
RUN yum install -y wget
