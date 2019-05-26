FROM alpine:latest

LABEL maintainer="Pawel Piwosz <devops@pawelpiwosz.net>"

# For Travis build
ARG BUILD_DATE
ARG VCS_REF
ARG VER

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/pawelpiwosz/docker-awscli"
LABEL org.label-schema.name="docker-awscli"
LABEL org.label-schema.description="CLI for AWS in Docker container"
LABEL org.label-schema.version=$VER

ARG AWS_OUTPUT
ARG AWS_REGION
ARG AWS_ACCESS
ARG AWS_SECRET

ENV AWS_OUTPUT=${AWS_OUTPUT}
ENV AWS_REGION=${AWS_REGION}
ENV AWS_ACCESS=${AWS_ACCESS}
ENV AWS_SECRET=${AWS_SECRET}

RUN apk --no-cache add --update \
    python3 \
    py3-pip \
    groff \
    ca-certificates
RUN pip3 install pip --upgrade \
    && pip3 install awscli

RUN mkdir /root/.aws \
    && { \
         echo '[default]'; \
         echo output = ${AWS_OUTPUT}; \
         echo region = ${AWS_REGION}; \
         echo aws_access_key_id = ${AWS_ACCESS}; \
         echo aws_secret_access_key = ${AWS_SECRET}; \
         } > /root/.aws/config

ENTRYPOINT ["aws"]
