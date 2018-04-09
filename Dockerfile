FROM openshift/base-centos7

ADD . /opt/mongosync

RUN yum install -y openssl

RUN echo "/opt/mongosync/output" >> /etc/ld.so.conf

ENTRYPOINT [ "/opt/mongosync/output/mongosync","-c" ]

CMD [ "/opt/mongosync/output/mongosync.conf" ]