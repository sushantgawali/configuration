# edX MySQL
#
# VERSION   0.1.0

FROM phusion/baseimage:0.9.15
MAINTAINER Filip Jukić <filip@appsembler.com>

ENV HOME /root

RUN apt-get update && apt-get -y install gcc python-dev python-apt python-setuptools git-core && easy_install pip && apt-get -y clean
RUN git clone https://github.com/antoviaque/configuration.git -b docker_multi_release-edxapp ~/configuration
WORKDIR /root/configuration
RUN pip install -r requirements.txt
WORKDIR $HOME/configuration/playbooks
ADD ./setup /root/
RUN chmod 777 /root/setup
RUN /root/setup && apt-get clean

EXPOSE 3306 11211

CMD ["/sbin/my_init", "--enable-insecure-key"]
