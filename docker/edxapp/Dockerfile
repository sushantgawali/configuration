# edX MySQL
#
# VERSION   0.1.0

FROM phusion/baseimage:0.9.15
MAINTAINER Filip Jukić <filip@appsembler.com>

RUN apt-get update && apt-get -y install gcc python-dev python-apt python-setuptools git-core && easy_install pip && apt-get -y clean
RUN git clone https://github.com/antoviaque/configuration.git -b docker_multi_release-edxapp /var/tmp/configuration
ADD vars.yml /root/
WORKDIR /var/tmp/configuration
RUN pip install -r requirements.txt
WORKDIR /var/tmp/configuration/playbooks
ADD ./setup /root/
RUN chmod 777 /root/setup
RUN PYTHONUNBUFFERED=1 /root/setup && apt-get clean

EXPOSE 8000 18010

CMD ["/sbin/my_init", "--enable-insecure-key"]
