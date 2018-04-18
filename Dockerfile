FROM openshift/base-centos7

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
 
#update application timezone
RUN echo "Asia/Shanghai" >> /etc/timezone

ADD ./output /opt/mongosync/output
COPY ./output/sync.ini /etc/supervisord.d
RUN yum install -y openssl
RUN yum install -y epel-release
RUN yum install -y supervisor

RUN echo "/opt/mongosync/output" >> /etc/ld.so.conf
RUN echo_supervisord_conf > /etc/supervisord.conf 
RUN ldconfig

ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]