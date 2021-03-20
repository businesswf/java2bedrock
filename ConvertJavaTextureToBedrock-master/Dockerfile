FROM node:14-alpine as build

COPY . /src
WORKDIR /src

ENV NODE_ENV development
RUN yarn

ENV NODE_ENV production
RUN yarn build

RUN cp -r build /build
WORKDIR /build
RUN rm -rf /src

FROM httpd:alpine

COPY --from=build /build /usr/local/apache2/htdocs
