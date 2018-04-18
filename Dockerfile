FROM openshift/base-centos7

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
 
#update application timezone
RUN echo "Asia/Shanghai" >> /etc/timezone

ADD ./output /opt/mongosync/output

RUN yum install -y openssl
RUN yum install -y epel-release
RUN yum install -y supervisor
ADD ./output/sync.conf /etc/supervisord.d/
RUN echo "/opt/mongosync/output" >> /etc/ld.so.conf
RUN ldconfig

CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisord.d/sync.conf" ]