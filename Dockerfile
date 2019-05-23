FROM alpine:latest

RUN apk --no-cache add --update \
	python3 \
	python3-pip \
	ca-certificates 
RUN pip install awscli

ENTRYPOINT ["aws"]
