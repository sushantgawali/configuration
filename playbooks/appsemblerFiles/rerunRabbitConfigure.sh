#!/bin/bash

sudo -H -u root /usr/local/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/playbooks/run_role.yml -i localhost, -c local -e role=rabbitmq_configure -e rabbitmq_ip=127.0.0.1 # --become-user=root &> /var/log/rabbitRerun.log

