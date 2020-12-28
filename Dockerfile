FROM certbot/certbot

ENTRYPOINT [ "" ]

VOLUME /etc/letsencrypt
EXPOSE 80

RUN echo '0	*	*	*	*	certbot renew -q' >> /etc/crontabs/root

CMD [ "sh", "-c", "crond -f" ]