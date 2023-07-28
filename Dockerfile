FROM node:16-alpine

USER root

WORKDIR /usr/estudo/teste-tallos

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

