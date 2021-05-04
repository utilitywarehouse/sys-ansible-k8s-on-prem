SHELL := /bin/bash

check_flag=
ifeq ($(DRY_RUN),true)
check_flag := "--check"
endif

check-test:
	echo $(check_flag)
	echo $(DRY_RUN)

dhcp-dev:
	ansible-playbook -i inventories/hosts dhcp_dev.yaml --diff $(check_flag) $(ARGS)

dhcp-prod:
	ansible-playbook -i inventories/hosts dhcp_prod.yaml --diff $(check_flag) $(ARGS)

netapp-exp:
	ansible-playbook -i inventories/hosts netapp_exp.yaml --diff $(check_flag) --tags=cfssl,kube

netapp-dev:
	ansible-playbook -i inventories/hosts netapp_dev.yaml --diff $(check_flag) $(ARGS)

netapp-prod:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff $(check_flag) $(ARGS)

cumulus:
	ansible-playbook -i inventories/hosts cumulus.yaml --diff $(check_flag) $(ARGS)

netapp-collections-install:
	ansible-galaxy collection install netapp.ontap
