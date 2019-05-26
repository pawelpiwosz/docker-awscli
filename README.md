## AWS CLI container

#### Tests status

[![Build Status](https://travis-ci.org/pawelpiwosz/docker-awscli.svg?branch=master)](https://travis-ci.org/pawelpiwosz/docker-awscli)
[![](https://images.microbadger.com/badges/image/almerhor/awscli.svg)](https://microbadger.com/images/almerhor/awscli "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/almerhor/awscli.svg)](https://microbadger.com/images/almerhor/awscli "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/almerhor/awscli.svg)](https://microbadger.com/images/almerhor/awscli "Get your own commit badge on microbadger.com")

### Synopsis

Use this container everywhere, without need of creating or copying credentials file.

### Pull image

In order to pull image from dockerhub registry, run:

```
docker pull almerhor/awscli
```

### Build

Image can be build as is:

```
docker build -t awscli .
```

Or with arguments:

```
docker build --build-arg AWS_OUTPUT=json \
  --build-arg AWS_REGION=us-east-1 \
  --build-arg AWS_ACCESS=something \
  --build-arg AWS_SECRET=something \
  -t awscli .
```

Also, values can be added in ARG section of Dockerfile:

```
ARG AWS_OUTPUT=json
ARG AWS_REGION=us-east-1
ARG AWS_ACCESS=something
ARG AWS_SECRET=something
```

but I don't recommend it.

The credentials file is not required, as local credentials can be mounted during container run.

### Run

In order to run this container, use:

```
docker run --rm awscli
```

example:

```
docker run --rm awscli s3 ls
```

In order to run with mounted credentials file, run:

```
docker run --rm -v $HOME/.aws:/root/.aws:ro awscli
```
