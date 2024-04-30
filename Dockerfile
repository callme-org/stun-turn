FROM coturn/coturn:latest

COPY ./turnserver.conf /etc/turnserver/turnserver.conf

EXPOSE 3478
EXPOSE 3478/udp

CMD turnserver -c /etc/turnserver/turnserver.conf
