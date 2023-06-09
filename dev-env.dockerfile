FROM       ubuntu:latest
MAINTAINER  jupiterben "https://github.com/jupiterben"

RUN apt-get update

RUN apt-get install -y openssh-server libatomic1
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]