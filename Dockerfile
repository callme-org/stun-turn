FROM coturn/coturn

COPY ./turnserver.conf.template /etc/turnserver/turnserver.conf.template

EXPOSE 3478
EXPOSE 3478/udp

CMD envsubst < /etc/turnserver/turnserver.conf.template > /etc/turnserver/turnserver.conf && turnserver -c /etc/turnserver/turnserver.conf