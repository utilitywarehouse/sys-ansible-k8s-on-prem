SHELL := /bin/bash

export DOCKER_BUILDKIT=1

build-ipxe-binaries:
	mkdir -p roles/dhcp/files/ipxe
	docker build -t sys-ipxe -o roles/dhcp/files/ipxe ipxe/

cumulus-dev-prod:
	ansible-playbook -i inventories/hosts cumulus_dev_prod.yaml --diff --check $(ARGS)

cumulus-dev-prod-execute:
	ansible-playbook -i inventories/hosts cumulus_dev_prod.yaml --diff $(ARGS)

cumulus-exp:
	ansible-playbook -i inventories/hosts cumulus_exp.yaml --diff --check $(ARGS)

cumulus-exp-execute:
	ansible-playbook -i inventories/hosts cumulus_exp.yaml --diff $(ARGS)

dhcp-dev:
	ansible-playbook -i inventories/hosts dhcp_dev.yaml --diff --check $(ARGS)

dhcp-dev-execute:
	ansible-playbook -i inventories/hosts dhcp_dev.yaml --diff $(ARGS)

dhcp-exp:
	ansible-playbook -i inventories/hosts dhcp_exp.yaml --diff --check $(ARGS)

dhcp-exp-execute:
	ansible-playbook -i inventories/hosts dhcp_exp.yaml --diff $(ARGS)

dhcp-prod:
	ansible-playbook -i inventories/hosts dhcp_prod.yaml --diff --check $(ARGS)

dhcp-prod-execute:
	ansible-playbook -i inventories/hosts dhcp_prod.yaml --diff $(ARGS)

netapp-cluster:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff --check $(ARGS) --tags=cluster

netapp-cluster-execute:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff $(ARGS) --tags=cluster

netapp-ld7-kube-cluster:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_prod.yaml --diff --check $(ARGS) --tags=cluster

netapp-ld7-kube-cluster-execute:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_prod.yaml --diff $(ARGS) --tags=cluster

netapp-dev:
	ansible-playbook -i inventories/hosts netapp_dev.yaml --diff --check $(ARGS) --skip-tags=cluster

netapp-dev-execute:
	ansible-playbook -i inventories/hosts netapp_dev.yaml --diff $(ARGS) --skip-tags=cluster

netapp-ld7-kube-dev:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_dev.yaml --diff --check $(ARGS) --skip-tags=cluster

netapp-ld7-kube-dev-execute:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_dev.yaml --diff $(ARGS) --skip-tags=cluster

netapp-exp:
	ansible-playbook -i inventories/hosts netapp_exp.yaml --diff --check $(ARGS) --skip-tags=matchbox,cluster

netapp-exp-execute:
	ansible-playbook -i inventories/hosts netapp_exp.yaml --diff $(ARGS) --skip-tags=matchbox,cluster

netapp-ld7-kube-exp:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_exp.yaml --diff --check $(ARGS) --skip-tags=matchbox,cluster

netapp-ld7-kube-exp-execute:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_exp.yaml --diff $(ARGS) --skip-tags=matchbox,cluster

netapp-prod:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff --check $(ARGS) --skip-tags=cluster

netapp-prod-execute:
	ansible-playbook -i inventories/hosts netapp_prod.yaml --diff $(ARGS) --skip-tags=cluster

netapp-ld7-kube-prod:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_prod.yaml --diff --check $(ARGS) --skip-tags=cluster

netapp-ld7-kube-prod-execute:
	ansible-playbook -i inventories/hosts netapp_ld7_kube_prod.yaml --diff $(ARGS) --skip-tags=cluster

netapp-collections-install:
	ansible-galaxy collection install --upgrade netapp.ontap
