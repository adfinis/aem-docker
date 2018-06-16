# aem-docker
Docker Images for Adobe Experience Manager

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

## docker-compose
Step 3. Run docker-compose
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