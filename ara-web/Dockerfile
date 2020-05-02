FROM docker.io/library/node:12 as builder

COPY ara-web /usr/src/app
WORKDIR /usr/src/app

RUN npm install
RUN npm run-script build

FROM docker.io/library/httpd:2.4 as ara-web

COPY --from=builder /usr/src/app/build/ /usr/local/apache2/htdocs/
