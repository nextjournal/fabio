FROM alpine:3.7
RUN apk add --no-cache bash curl grep
ADD fabio.properties /etc/fabio/fabio.properties
ADD fabio /
EXPOSE 9998 9999
CMD ["/fabio", "-cfg", "/etc/fabio/fabio.properties"]
