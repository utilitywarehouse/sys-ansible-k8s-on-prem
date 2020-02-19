SHELL := /bin/bash

version-check:
	ansible --version | head -n 1 | awk '$$2<2.7 {print "ansible version < 2.7"; exit 1}'

nxos-dev-all: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff

nxos-dev-kubernetes: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff --tags "kubernetes"

nxos-dev-routing: version-check
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --diff --tags "routing"

check-nxos-dev: version-check
	# Beware that not every command under nxos network module support check
	# mode so running this could actually make changes to the target boxes.
	# So this is not 100% dry-run mode
	ansible-playbook -i inventories/dev/hosts nxos_dev.yaml --check --diff

dhcp-dev: version-check
	ansible-playbook -i inventories/dev/hosts dhcp_dev.yaml --diff

dry-run-dhcp-dev: version-check
	ansible-playbook -i inventories/dev/hosts dhcp_dev.yaml --check --diff
