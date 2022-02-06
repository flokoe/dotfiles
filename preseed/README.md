# Preseeding

To automate the installation of the OS (partitioning etc) I use the preseeding feature for debian based distributions.

I usually try to use net boot via [netboot.xyz](https://netboot.xyz/) and the chaning feature for iPXE. In iPXE shell:

```plain
dhcp
# if https does not work try http
chain --autofree https://boot.netboot.xyz
```

If there is no IPXE environment available I try [booting netboot.xyz from USB](https://netboot.xyz/docs/booting/usb).

In the menu of netboot.xyz select *Linux Network Installs* > `$DISTRO` > `$RELEASE` > *Specify preseed url* and enter the coresponding URL from table below.

## Available preseed files

| Name | URL | Description |
| --- | --- | ---|
| `debian11_enc_mouseless_dev.cfg` | <https://tinyurl.com/tkw3emnd> | Preseed for Debian 11, but should work for older versions as well. Configures Debian with separate root, home and swap partion in encrypted lvm volume. |
