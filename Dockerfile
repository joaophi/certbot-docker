FROM certbot/certbot

ENTRYPOINT [ "" ]

VOLUME /etc/letsencrypt
EXPOSE 80

RUN echo '0	*	*	*	*	certbot renew -q' >> /etc/crontabs/root

CMD [ "sh", "-c", "certbot certonly --standalone -d ${DOMAIN} -m ${EMAIL} --agree-tos --preferred-challenges http-01 -n && crond -f" ]