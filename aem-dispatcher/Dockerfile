FROM aem-base
MAINTAINER Adfinis SyGroup/Namics

# Download the Dispatcher
RUN curl -s https://www.adobeaemcloud.com/content/companies/public/adobe/dispatcher/dispatcher/_jcr_content/top/download_8/file.res/dispatcher-apache2.4-linux-x86-64-4.2.2.tar.gz -O
# RUN curl -s https://www.adobeaemcloud.com/content/companies/public/adobe/dispatcher/dispatcher/_jcr_content/top/download_8/file.res/dispatcher-apache2.4-linux-x86-64-4.2.3.tar.gz -O
RUN mkdir dispatcher
RUN tar -C dispatcher -zxvf dispatcher-apache2.*.tar.gz

# Copy Dispatcher
RUN cp ./dispatcher/dispatcher-apache2.*.so /etc/httpd/modules/
RUN ln -s /etc/httpd/modules/dispatcher-apache2.*.so /etc/httpd/modules/mod_dispatcher.so

# Add config files
COPY aem-disp2.conf /etc/httpd/conf.d/aem-disp2.conf
COPY dispatcher.any /etc/httpd/conf/dispatcher.any

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

EXPOSE 80 443
