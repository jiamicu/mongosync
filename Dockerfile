FROM openshift/base-centos7

ADD ./output /opt/mongosync/output

RUN yum install -y openssl

RUN echo "/opt/mongosync/output" >> /etc/ld.so.conf

RUN ldconfig

ENTRYPOINT [ "/opt/mongosync/output/mongosync","-c" ]

CMD [ "/opt/mongosync/output/mongosync.conf" ]