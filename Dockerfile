FROM nbrown/nginxhello
COPY config/default.conf /etc/nginx/conf.d
COPY config/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /certs
COPY ./certs /certs
RUN cd /certs && cat star_monifair_com.crt DigiCertCA.crt >> chain.crt
RUN cd /certs && cat star_monifair_com.key >> chain.key

#RUN echo -n 'serviceadmin:' >> /etc/nginx/.htpasswd
#RUN printf "serviceadmin:$(openssl passwd -1 "admin1234")\n" >> /etc/nginx/.htpasswd

EXPOSE 443
