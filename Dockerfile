FROM ubuntu:23.04

RUN apt update
RUN apt install coturn -y

COPY turnserver.conf /etc/turnserver.conf

env DATABASE_HOST=${DATABASE_HOST}
env DATABASE_PORT=${DATABASE_PORT}
env DATABASE_NAME=${DATABASE_NAME}
env DATABASE_USERNAME=${DATABASE_USERNAME}
env DATABASE_PASSWORD=${DATABASE_PASSWORD}

RUN coturn -M "host=$DATABASE_HOST dbname=$DATABASE_NAME user=$DATABASE_USERNAME password=$DATABASE_PASSWORD port=3306 connect_timeout=20 read_timeout=20"

RUN sed -i "s/USER=turnserver/USER=root/" /etc/init.d/coturn
RUN sed -i "s/GROUP=turnserver/GROUP=root/" /etc/init.d/coturn
RUN sed -i "s/#TURNSERVER_ENABLED=1/TURNSERVER_ENABLED=1/" /etc/default/coturn

RUN service coturn stop

CMD service coturn start && tail -f /dev/null