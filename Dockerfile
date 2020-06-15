FROM centos

RUN yum install sudo -y
COPY kubernetes.repo /etc/yum.repos.d
RUN yum install kubectl -y
RUN yum install java -y
RUN yum install git -y
COPY client.crt /root
COPY client.key /root
COPY ca.crt /root
COPY config /root/.kube/
RUN ssh-keygen -A
CMD ["/usr/sbin/sshd", "-D"] && /bin/bash
CMD sentenforce 0
RUN yum install vim -y
RUN yum install /sbin/service -y
RUN yum install httpd -y
RUN yum install php -y
COPY *.html /var/www/html/
CMD /usr/sbin/httpd -DFOREGROUND && /bin/bash
COPY ./index.html /var/www/html/
Expose 80
