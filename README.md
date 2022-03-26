# GBA RDP Docker

**This file is under construction**

This docker is use only for Retrobrew

## General information
* Ubuntu bionic
* vba-m
* xrdp
* firejail
* xterm (for dev only)

Edit ``root/defaults/startwm.sh`` for execute an autoboot (load automatically a rom gba)

## How to run

```shell
$: docker run -d --name=w<VM NAME> \ 
                --security-opt \
                --seccomp=unconfined \
                -e PUID=1000 \
                -e PGID=1000 \
                -e TZ=Europe/London \
                -p <EXTERNAL PORT>:3389 gba-rdp
```

# Thanks
* [linuxserver/rdesktop](https://github.com/Retrobrew/gba_docker)
