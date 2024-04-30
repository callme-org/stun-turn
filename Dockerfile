FROM coturn/coturn

COPY turnserver.conf /etc/turnserver/turnserver.conf
CMD envsubst < turnserver.conf /etc/turnserver/turnserver.conf > turnserver.conf /etc/turnserver/turnserver.conf && turnserver -c turnserver.conf /etc/turnserver/turnserver.conf

EXPOSE 3478
EXPOSE 3478/udp