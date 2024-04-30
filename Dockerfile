FROM coturn/coturn

COPY turnserver.conf /etc/turnserver.conf
CMD envsubst < turnserver.conf > /etc/turnserver.conf && turnserver -c /etc/coturn/coturn.conf

EXPOSE 3478
EXPOSE 3478/udp
EXPOSE 8484