Ansible scripts to setup on-prem environment components that do not fit in our
terraform based model.

# Requirements

- ansible >=2.7 local setup
- `system` strongbox key

# Makefile support

There is a [Makefile](./Makefile) which includes targets for the playbooks that
one would need to run from this repo.

For example:
```
make dhcp-dev
```
will run the [dhcp-dev](./dhcp_dev.yaml) playbook against hosts specified under
the defined [hosts](./inventories/hosts)

`DRY_RUN` environment variable can be used as `DRY_RUN=true make dhcp-dev` to
perform dry runs and check diffs before actually applying playbooks config.

`netapp-collections-install` is also available to install netapp library
dependencies that do not ship with ansible by default.

Optionally `ARGS` environment variable can be used to append arguments to
playbook commands, like `make cumulus ARGS="--tags frr"`

Please add new targets for all new roles and collections installations needed.
