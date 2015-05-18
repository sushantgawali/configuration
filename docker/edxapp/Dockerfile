# edX MySQL
#
# VERSION   0.1.0

FROM phusion/baseimage:0.9.15
MAINTAINER Filip Jukić <filip@appsembler.com>

ENV HOME /root
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get -y install gcc python-dev python-apt python-setuptools git-core && easy_install pip && apt-get -y clean
ADD vars.yml /root/
RUN git clone https://github.com/emrob/configuration.git -b docker_multi_release /var/tmp/configuration
WORKDIR /var/tmp/configuration
RUN pip install -r requirements.txt
WORKDIR /var/tmp/configuration/playbooks
ADD ./setup /root/
ADD ./init.sh /root/
RUN chmod 777 /root/setup
RUN /root/setup && apt-get clean

EXPOSE 80 18010 18020

CMD ["/root/init.sh"]
