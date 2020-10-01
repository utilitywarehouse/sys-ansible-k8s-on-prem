SHELL := /bin/bash

check_flag=
ifeq ($(DRY_RUN),true)
check_flag := "--check"
endif

check-test:
	echo $(check_flag)
	echo $(DRY_RUN)

version-check:
	ansible --version | head -n 1 | awk '$$2<2.7 {print "ansible version < 2.7"; exit 1}'

dhcp-dev: version-check
	ansible-playbook -i inventories/hosts dhcp_dev.yaml --diff $(check_flag)

dhcp-prod: version-check
	ansible-playbook -i inventories/hosts dhcp_prod.yaml --diff $(check_flag)

netapp-dev: version-check
	ansible-playbook -i inventories/hosts netapp_dev.yaml --diff $(check_flag)

netapp-prod: version-check
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff $(check_flag)

netapp-collections-install:
	ansible-galaxy collection install netapp.ontap
