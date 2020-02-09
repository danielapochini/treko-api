FROM node:8-alpine
USER root

RUN apk add mongodb

VOLUME /data/db
EXPOSE 27017 28017

COPY /scripts/run.sh /root
RUN ["chmod", "+x", "/root/run.sh" ]
CMD [ "mongod", "--bind_ip", "0.0.0.0" ]