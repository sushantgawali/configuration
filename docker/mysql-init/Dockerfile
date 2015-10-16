FROM phusion/baseimage

ENV HOME /root
RUN apt-get update && apt-get -y install python-dev python-setuptools python-mysqldb git-core && easy_install pip && apt-get -y clean
ADD vars.yml /root/
RUN git clone https://github.com/appsembler/configuration.git -b docker_multi_release /root/configuration
WORKDIR /root/configuration
RUN pip install -r requirements.txt

WORKDIR /root/configuration/playbooks
CMD ["/usr/local/bin/ansible-playbook -vvv -i 127.0.0.1, -e @/root/vars.yml -e @/root/secrets.yml -c local mysql-init.yml"]
