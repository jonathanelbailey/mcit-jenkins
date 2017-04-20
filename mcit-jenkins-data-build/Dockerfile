from debian:jessie
MAINTAINER Jonathan Bailey

RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

USER root

RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins

USER jenkins

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]

CMD ["echo", "Data container for Jenkins"]
