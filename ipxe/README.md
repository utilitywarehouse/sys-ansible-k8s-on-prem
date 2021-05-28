This is a helper to build ipxe binaries from git.ipxe.org with an additional
embed script to retry on dhcp failures.
The produced binary is meant to be used directly on our ansible dhcp setup and
can be particularly useful when booting nodes that live on hpe m700 hardware.
Retrying on dhcp failure and rebooting the nodes after a few tries is considered
a good practice and could be useful for all our nodes that need to use an ipxe
image to boot.
