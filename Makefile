SHELL := /bin/bash

export DOCKER_BUILDKIT=1

check_flag=
ifeq ($(DRY_RUN),true)
check_flag := "--check"
endif

build-ipxe-binaries:
	mkdir -p roles/dhcp/files/ipxe
	docker build -t sys-ipxe -o roles/dhcp/files/ipxe ipxe/

check-test:
	@echo check_flat=$(check_flag)
	@echo DRY_RUN=$(DRY_RUN)

dhcp-dev:
	ansible-playbook -i inventories/hosts dhcp_dev.yaml --diff $(check_flag) $(ARGS)

dhcp-exp:
	ansible-playbook -i inventories/hosts dhcp_exp.yaml --diff $(check_flag) $(ARGS)

dhcp-prod:
	ansible-playbook -i inventories/hosts dhcp_prod.yaml --diff $(check_flag) $(ARGS)

netapp-exp:
	ansible-playbook -i inventories/hosts netapp_exp.yaml --diff $(check_flag) --skip-tags=matchbox

netapp-dev:
	ansible-playbook -i inventories/hosts netapp_dev.yaml --diff $(check_flag) $(ARGS) --skip-tags=minio

netapp-prod:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff $(check_flag) $(ARGS) --skip-tags=minio

cumulus-dev-prod:
	ansible-playbook -i inventories/hosts cumulus_dev_prod.yaml --diff $(check_flag) $(ARGS)

cumulus-exp:
	ansible-playbook -i inventories/hosts cumulus_exp.yaml --diff $(check_flag) $(ARGS)

netapp-collections-install:
	ansible-galaxy collection install netapp.ontap
