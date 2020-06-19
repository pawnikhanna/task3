FROM centos
RUN yum install httpd -y
COPY *.html /var/www/html
RUN yum install /sbin/service -y
CMD /usr/sbin/httpd -DFOREGROUND && /bin/bash
EXPOSE 80
