FROM node:8-alpine
USER root

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add mongodb=3.4.4-r0

RUN mongo --version

VOLUME /data/db
EXPOSE 27017 28017

COPY /scripts/run.sh /root
ENTRYPOINT ["/root/run.sh"]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]