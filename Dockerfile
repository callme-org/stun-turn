FROM coturn/coturn

COPY --chmod=644 ./turnserver.conf /etc/turnserver/turnserver.conf

EXPOSE 3478
EXPOSE 3478/udp

CMD envsubst < /etc/turnserver/turnserver.conf > /etc/turnserver/turnserver.conf && turnserver -c /etc/turnserver/turnserver.conf