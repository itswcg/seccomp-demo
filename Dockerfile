FROM ubuntu:20.04
MAINTAINER itswcg

RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt update && \
    apt -y install \
    build-essential \
    cmake \
    gdb \
    openssh-server \
    vim

RUN mkdir /var/run/sshd
RUN sed -ri 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN apt-get install -y rsync
RUN sed -ri 's/RSYNC_ENABLE=false/RSYNC_ENABLE=true/g' /etc/default/rsync
COPY rsync.conf /etc

RUN echo root:123456 | chpasswd

RUN mkdir /root/sync

COPY entrypoint.sh /sbin
RUN chmod +x /sbin/entrypoint.sh
ENTRYPOINT [ "/sbin/entrypoint.sh" ]
