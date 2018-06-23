# aem-docker
Docker Images for Adobe Experience Manager

AEM_6.X_Quickstart.jar & license.properties required in the project root

Update the VERSION environment variable in .env for your version of the AEM_6.X_Quickstart.jar
for example:
```
VERSION=6.3
```

## aem-base
**Step 1** - Build the aem-base image

```bash
cd aem-base
docker build -t aem-base .
```

## aem-dispatcher
**Step 2** - Build the aem-base image

```bash
cd aem-dispatcher
docker build -t aem-base .
```

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

## repository persistence

Assuming that the aem images containers are up and running via `docker-compose up -d` from the previous section,
use a Docker data only container, where we create a volume from the aem-author image. In this example, the aem author image is `aem-author:6.3`.

**Step 1** - Needed is the the repository segmentstore path, e.g.,
`/aem/crx-quickstart/repository/segmentstore`

To get this path, shell into the container, e.g.,
```bash
docker exec it <CONTANER ID or NAME> sh

find . -name segmentstore

# cd to the returned path, e.g.,
cd ./crx-quickstart/repository/segmentstore

# get the path using pwd
pwd
/aem/crx-quickstart/repository/segmentstore
```

**Step 2** - After getting the segmentstore path, we can now stop the running aem containers or use `docker-compose down` to remove them since a new `aem_author_instance` container will be created in step 4 below.

**Step 3** - Create the volume from the `aem-author:6.3` image using the segmentstore path. e.g.,
```bash
docker create -v /aem/crx-quickstart/repository/segmentstore --name aem_arepo aem-author:6.3 /bin/true
```

**Step 4** - Create a new `aem_author_instance` container using the `--volumes-from` option to mount the repository volume from the aem_repo data container
```bash
docker run -d --name=aem_author_instance --volumes-from aem_arepo -p 4502-4503:4502-4503 aem-author:6.3
```

Use `docker ps -a` to list running containers.
You should see something similar to this output
```bash
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                                        NAMES
224d8b551a64        aem-author:6.3        "/aem/crx-quickstart…"   14 seconds ago      Up 13 seconds       0.0.0.0:4502-4503->4502-4503/tcp, 8000/tcp   aem_author_instance
31747c4e25b4        aem-author:6.3        "/aem/crx-quickstart…"   44 seconds ago      Created                                                          aem_arepo
```

Now you can install packages and they will persist in the running `aem_author_instance` container. For example, upgrade AEM 6.3 with the AEM 6.3.2.0 Service Pack `AEM-6.3.2.0-6.3.2.zip` package from [AEM releases and updates](https://helpx.adobe.com/experience-manager/aem-releases-updates.html)

stop/start the `aem_author_instance` container as needed
```bash
docker stop aem_author_instance
```

