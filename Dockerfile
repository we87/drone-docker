FROM we87/confd-base:v0.11.0

ENV DRONE_VERSION 0.4

ADD drone_static /drone_static

CMD wrar /drone_static
