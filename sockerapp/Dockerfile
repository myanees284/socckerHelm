FROM mhart/alpine-node:7.10.1
MAINTAINER Anees anees284@gmail.com


RUN mkdir -p /myapp
WORKDIR /myapp
COPY sockerapp /myapp
RUN npm install
EXPOSE 2000
CMD node app.js
