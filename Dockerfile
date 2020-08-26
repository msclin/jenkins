FROM jenkins/jenkins:lts
ENV REFRESHED_AT 2020-08-25
LABEL maintainer="marc.clinedinst@fiscalnote.com"

USER root
RUN apt-get -qqy update
RUN apt-get install -qqy sudo
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN wget http://get.docker.com/builds/Linux/x86_64/docker-latest.tgz
RUN tar -xvzf docker-latest.tgz
RUN mv docker/* /usr/bin/

# https://stackoverflow.com/questions/29328278/installing-jenkins-plugins-to-docker-jenkins

USER jenkins
RUN /usr/local/bin/install-plugins.sh junit git git-client ssh-slaves greenballs chucknorris ws-cleanup