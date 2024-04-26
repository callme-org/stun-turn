FROM ubuntu:23.04

RUN apt update
RUN apt install coturn -y

COPY turnserver.conf /etc/turnserver.conf

RUN sed -i "s/USER=turnserver/USER=root/" /etc/init.d/coturn
RUN sed -i "s/GROUP=turnserver/GROUP=root/" /etc/init.d/coturn
RUN sed -i "s/#TURNSERVER_ENABLED=1/TURNSERVER_ENABLED=1/" /etc/default/coturn

RUN service coturn stop

CMD service coturn start && tail -f /dev/null