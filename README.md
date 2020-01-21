Ansible scripts to setup on-prem environment

Assumes:
- ansible 2.7 local setup
- `system` ansible vault password stored under `${HOME}/ansible/vault_password`
- working local ssh connection to nxos switch

Example for configuring nxos switch for dev/lab environment

```
ansible-playbook -i inventories/dev/hosts nxos_dev.yaml
```

There is also Makefile support that includes the basic commands, etc:

```
make nxos-dev
```
will have the same result as the above command.

test
