FROM coturn/coturn:latest

COPY ./turnserver.conf.template /etc/turnserver/turnserver.conf.template

EXPOSE 3478
EXPOSE 3478/udp

CMD sed -e "s|\${HOST_IP}|${HOST_IP}|" \
    -e "s|\${DATABASE_HOST}|${DATABASE_HOST}|" \
    -e "s|\${DATABASE_NAME}|${DATABASE_NAME}|" \
    -e "s|\${DATABASE_USERNAME}|${DATABASE_USERNAME}|" \
    -e "s|\${DATABASE_PASSWORD}|${DATABASE_PASSWORD}|" \
    -e "s|\${DATABASE_PORT}|${DATABASE_PORT}|" \
    -e "s|\${COTURN_AUTH_SECRET}|${COTURN_AUTH_SECRET}|" \
    /etc/turnserver/turnserver.conf.template > /etc/turnserver/turnserver.conf \
&& turnserver -c /etc/turnserver/turnserver.conf
