FROM coturn/coturn

COPY turnserver.conf /etc/turnserver/turnserver.conf

RUN chmod 644 /etc/turnserver/turnserver.conf

EXPOSE 3478
EXPOSE 3478/udp

CMD envsubst < /etc/turnserver/turnserver.conf > /etc/turnserver/turnserver.conf && turnserver -c /etc/turnserver/turnserver.conf