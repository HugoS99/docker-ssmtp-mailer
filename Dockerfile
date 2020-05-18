FROM alpine:latest

RUN apk update \
 && apk add --no-cache ssmtp shadow && apk add --no-cache mailutils --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY mailer.sh /

RUN chmod +x /mailer.sh

ENTRYPOINT []

CMD ["/mailer.sh"]