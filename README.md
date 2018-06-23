# aem-docker
Docker Images for Adobe Experience Manager

AEM_6.X_Quickstart.jar & license.properties required in the project root

update the VER arg in author.dockerfile and publisher.dockerfile for your version of the AEM_6.X_Quickstart.jar


## aem-base
Step 1. Build the aem-base image

```bash
cd aem-base
docker build -t aem-base .
```

## aem-dispatcher
Step 2. Build the aem-base image

```bash
cd aem-dispatcher
docker build -t aem-base .
```

## volumes
TODO: Create Volumes to persist AEM Data
https://www.linkedin.com/pulse/running-aem-docker-satendra-singh/


## docker-compose

Use docker-compose to create the author and publisher images if they do not already exist and implement the containers.

```bash
docker-compose up -d
```

This error indicates that port 80 already in use
```
ERROR: for dispatcher  Cannot start service dispatcher: b'driver failed programming external connectivity on endpoint docker_dispatcher_1 (ID): Error starting userland proxy: Bind for 0.0.0.0:80: unexpected error Permission denied'
ERROR: Encountered errors while bringing up the project.
```
For example, stop the services using port 80 in Windows
CMD (as administrator)
```
net stop was
```

Use `docker stop` [CONTAINER ID] instead of `docker-compose down` if you do not want to lose any changes made. `docker start` [CONTAINER ID] to continue where you left off.


> Create a new image from a container’s changes

For example, after installing a service pack from Adobe to upgrade AEM

```
docker commit [CONTAINER ID] aem-author:6.3.2
```
