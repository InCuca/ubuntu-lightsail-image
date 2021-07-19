FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ubuntu-server wget nano sudo openssh-server rsync
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
RUN echo 'ubuntu:ubuntu' | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service  --status-all
RUN service ssh start

COPY ./incuca.pem /home/ubuntu/

WORKDIR /home/ubuntu
RUN mkdir wwww

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

