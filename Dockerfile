FROM alpine:latest

RUN apk --no-cache add --update \
    python3 \
    py3-pip \
    groff \
    ca-certificates 
RUN pip3 install pip --upgrade \
    && pip3 install awscli

ENTRYPOINT ["aws"]
