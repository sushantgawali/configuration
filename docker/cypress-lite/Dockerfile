FROM phusion/baseimage:0.9.16
MAINTAINER Appsembler <info@appsembler.com>

ENV PYTHONUNBUFFERED 1

ADD server-vars.yml /tmp/
RUN apt-get update && apt-get -y install gcc python-dev python-apt python-setuptools git-core && easy_install pip && apt-get clean
RUN git clone -b appsembler_docker/feature/mergeCypress https://github.com/appsembler/configuration /configuration

WORKDIR /configuration
RUN pip install -r requirements.txt

WORKDIR /configuration/playbooks
#ADD course.tar.gz /tmp/
ADD setup /root/
RUN chmod 777 /root/setup
RUN /root/setup && apt-get clean

# Workaround: Mongo users created on the first run of the Ansible playbook are
# not persisted, probably due to runit weirdness. Creating the users after the
# container has a chance to restart fixes the issue.
ADD post_setup /root/
RUN chmod 777 /root/post_setup
RUN /root/post_setup && apt-get clean

# Add configuration script to run on startup
ADD configure /etc/service/configure/run
RUN chmod 777 /etc/service/configure/run

EXPOSE 80 18010 18020

CMD ["/sbin/my_init", "--enable-insecure-key"]
