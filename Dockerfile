FROM jenkins:1.642.1

USER root

RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: /bin/docker.io" >> /etc/sudoers

COPY docker.sh /usr/bin/docker
RUN chmod +x /usr/bin/docker

USER jenkins
