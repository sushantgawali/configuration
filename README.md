# Dogwood Demo server

## Installation
1. Clone the repo and checkout the `dogwood-demo-server` branch:

	```shell
	git clone https://github.com/appsembler/configuration.git
	cd configuration
	git checkout dogwood-demo-server
	```

2. Create a virtualenv and install Ansible requirements:

	```shell
	virtualenv dogwood-demo
	source dogwood-demo/bin/activate
	pip install requirements.txt
	```
	
3. Download the [server-vars.yml](https://github.com/noderabbit-team/edx-configs/blob/master/dogwood_demo/production/files/server-vars.yml) file from edx-configs repo and put it in the current folder
4. Run the ansible playbook to provision the server:

	```shell
	cd playbooks
	ansible-playbook ./demo-server-fullstack.yml -i "104.196.58.70," -e @../server-vars.yml
	```
