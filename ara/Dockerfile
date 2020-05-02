FROM opendevorg/python-builder:3.8 as builder
COPY . /tmp/src
RUN assemble ara[server] mysqlclient

FROM opendevorg/uwsgi-base:3.8 as ara
COPY --from=builder /output/ /output
RUN /output/install-from-bindep

ENV ARA_BASE_DIR  /etc/ara
USER nobody
EXPOSE 9000
CMD ["uwsgi", "--master", \
              "--processes", "4", \
              "--http-socket", "0.0.0.0:9000", \
              "--module", "ara.server.wsgi"]
