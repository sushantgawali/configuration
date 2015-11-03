FROM phusion/baseimage:0.9.15
MAINTAINER Appsembler <info@appsembler.com>

ENV HOME /root
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get -y install gcc python-dev python-apt python-setuptools git-core && easy_install pip && apt-get clean
ADD vars.yml /root/
RUN git clone https://github.com/appsembler/configuration.git -b docker_multi_release /var/tmp/configuration

WORKDIR /var/tmp/configuration
RUN pip install -r requirements.txt

WORKDIR /var/tmp/configuration/playbooks
ADD ./setup /root/
RUN chmod 777 /root/setup
RUN /root/setup && apt-get clean

# Add configuration script to run on startup
ADD configure /etc/service/configure/run

EXPOSE 18080

CMD ["/sbin/my_init", "--enable-insecure-key"]
