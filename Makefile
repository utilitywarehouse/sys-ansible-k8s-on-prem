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

# Beware that not every command under nxos network module support check
# mode so running this could actually make changes to the target boxes.
nxos-dev-all: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff $(check_flag)

nxos-dev-kubernetes: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff --tags "kubernetes" $(check_flag)

nxos-dev-routing: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff --tags "routing" $(check_flag)

nxos-dev-netapp: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff --tags "netapp" $(check_flag)

dhcp-dev: version-check
	ansible-playbook -i inventories/dev/hosts dhcp_dev.yaml --diff $(check_flag)

netapp-dev: version-check
	ansible-playbook -i inventories/dev/hosts netapp_dev.yaml --diff $(check_flag)

install-netapp-collections:
	ansible-galaxy collection install netapp.ontap
