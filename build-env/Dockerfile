FROM jenkins/jenkins:lts

USER root

RUN apt-get update

# install docker
ARG DOCKER_CLIENT="docker-17.12.0-ce.tgz"
RUN cd /tmp/ \
&& curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/${DOCKER_CLIENT} \
&& tar zxf ${DOCKER_CLIENT} \
&& mkdir -p /usr/local/bin \
&& mv ./docker/docker /usr/local/bin \
&& chmod +x /usr/local/bin/docker \
&& rm -rf /tmp/*

# sudoers
RUN apt-get install -y sudo
RUN echo "jenkins ALL = NOPASSWD: /var/run/docker.sock" >> /etc/sudoers
RUN echo "jenkins ALL = NOPASSWD: /usr/local/bin/docker" >> /etc/sudoers

# install maven
RUN apt-get -y install maven

# drop back to the regular jenkins user - good practice
USER jenkins

# port settings
ENV JENKINS_OPTS --httpPort=8080
EXPOSE 8080


# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt