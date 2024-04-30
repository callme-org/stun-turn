FROM coturn/coturn

COPY turnserver.conf /etc/turnserver/turnserver.conf
CMD envsubst < /etc/turnserver/turnserver.conf > /etc/turnserver/turnserver.conf && turnserver -c /etc/turnserver/turnserver.conf

EXPOSE 3478
EXPOSE 3478/udp