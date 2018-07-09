FROM aem-base
MAINTAINER Adfinis SyGroup/Namics

# AEM VERSION, e.g., 6.3
ARG version

# Copies required build media
COPY AEM_${version}_Quickstart.jar /aem/AEM_${version}_Quickstart.jar
COPY license.properties /aem/license.properties
COPY aem-author/postInstallHook.py /aem/postInstallHook.py

# Extracts AEM
WORKDIR /aem
RUN java -XX:MaxPermSize=256m -Xmx1024M -jar AEM_${version}_Quickstart.jar -unpack -r nosamplecontent

# Add customised log file, to print the logging to standard out.
COPY aem-author/org.apache.sling.commons.log.LogManager.config /aem/crx-quickstart/install/

# Installs AEM
RUN python aemInstaller.py -i AEM_${version}_Quickstart.jar -r author -p 4502

EXPOSE 4502 8000
ENTRYPOINT ["/aem/crx-quickstart/bin/quickstart"]
