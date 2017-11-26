FROM docker.io/sumpfgottheit/aw-python
MAINTAINER florian.sachs@gmx.at

RUN apk update  && \
    apk add sudo vim make bash git coreutils tar wget openssh tini && \
    touch /var/log/lastlog && \
    ssh-keygen -A 
ADD artifacts/entrypoint.sh /
ADD artifacts/adapt_user.sh /
ADD artifacts/source_container_env.sh /etc/profile.d
ADD artifacts/alpine_create_hr_environment.sh /tmp/
RUN sh /tmp/alpine_create_hr_environment.sh
RUN mkdir /docker-entrypoint.d
RUN rm -fr /tmp/* /var/cache/apk/* 

ENTRYPOINT [ "/sbin/tini", "--", "/entrypoint.sh" ]
CMD ["/usr/sbin/sshd", "-D" ]




