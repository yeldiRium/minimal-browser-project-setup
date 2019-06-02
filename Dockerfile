FROM node:12-alpine as builder
WORKDIR /build

ADD package.json package.json
ADD package-lock.json package-lock.json

RUN npm install

ADD .babelrc .babelrc
ADD webpack.config.js webpack.config.js
ADD src/ src/

RUN npm run build


FROM bitnami/apache:latest

# This directory needs to exist for the image to work.
RUN mkdir -p /bitnami/apache/conf/vhosts/htaccess
ADD apache/vhost.conf /bitnami/apache/conf/vhosts/app.conf

COPY --from=builder /build/dist /app
ADD apache/.htaccess /app/.htaccess
