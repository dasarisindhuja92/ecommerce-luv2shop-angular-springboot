FROM node:14.20.0-alpine as build

user root

WORKDIR /app

RUN chmod -R 777 /app


COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6

COPY . /app


RUN chmod -R 777 node_modules

RUN chmod -R 777 /app/*

RUN chmod -R 777 /app/.angular/cache/14.2.3/bable-webpack/*
RUN npm run build

CMD ["ng", "serve"]

