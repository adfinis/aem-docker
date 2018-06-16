# aem-docker
Docker Image for Adobe Enterprise Manager

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