FROM registry.access.redhat.com/ubi8-init
RUN yum install httpd -y
USER root
RUN sed -i -e 's|^DocumentRoot.*"/var/www/html"|DocumentRoot "/root"|g' /etc/httpd/conf/httpd.conf 
WORKDIR /root
RUN echo 'hello' > /root/index.html
ENTRYPOINT ["httpd", "-D", "FOREGROUND"]


