FROM node:18

RUN apt-get update && \
apt-get install -y --no-install-recommends python3 g++ build-essential git vim && \
yarn config set python /usr/bin/python3

WORKDIR /backstage
ENV BACKSTAGE_APP_NAME=app
ENV BACKSTAGE_CREATE_APP_VERSION="0.5.8"

RUN yarn config set network-timeout 300000
RUN echo "Installing the latest Backstage app using Create App version $BACKSTAGE_CREATE_APP_VERSION"
RUN npx -y -q @backstage/create-app@$BACKSTAGE_CREATE_APP_VERSION

COPY ./package.json /backstage/app/package.json
WORKDIR /backstage/app
RUN yarn install