FROM domblack/oracle-jre8
MAINTAINER Adfinis SyGroup/Namics

RUN yum install -y epel-release && yum clean all
RUN yum install -y --enablerepo=centosplus \
      libselinux-devel \
      httpd \
      wget \
      zip \
      python-psutil \
      python-pycurl \
    && yum clean all

# Install utility for AEM
COPY aemInstaller.py /aem/aemInstaller.py
