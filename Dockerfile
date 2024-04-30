FROM coturn/coturn:latest

COPY ./turnserver.conf.template /etc/turnserver/turnserver.conf.template

EXPOSE 3478
EXPOSE 3478/udp

RUN apk add --no-cache gettext

CMD envsubst < /etc/turnserver/turnserver.conf.template > /etc/turnserver/turnserver.conf && turnserver -c /etc/turnserver/turnserver.conf
