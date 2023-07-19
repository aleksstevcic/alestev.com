FROM nginx:stable-alpine-slim
ARG CACHEBUST=1
COPY ./ /usr/share/nginx/html/
RUN ls /usr/share/nginx/html/*
COPY ./config/ /etc/nginx/conf.d/