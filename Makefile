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

dhcp-exp:
	@echo "ATTENTION - This updates only the dhcp and not tftp, as the latter listens on all vrf interfaces.\
	Thus we only need to configure this once for dev vrf. If needed run \
	make dhcp-dev ARGS=\"--tags=tftp\" to configure dev tftp server only"
	ansible-playbook -i inventories/hosts dhcp_exp.yaml --diff $(check_flag) --tags=dhcp $(ARGS)

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
