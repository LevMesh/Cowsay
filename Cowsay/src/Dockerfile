FROM node:8.11-alpine

WORKDIR /app/code
EXPOSE 8080

COPY ./package.json /app/code
COPY ./package-lock.json /app/code
RUN npm i

COPY . /app/code

CMD node index.js
