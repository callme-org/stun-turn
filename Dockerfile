FROM coturn/coturn

COPY turnserver.conf /etc/turnserver.conf
COPY auth_script.sh /usr/local/bin/auth_script.sh

RUN chmod +x /usr/local/bin/auth_script.sh

CMD ["--external-auth-command=/usr/local/bin/auth_script.sh"]

EXPOSE 3478
EXPOSE 3478/udp
