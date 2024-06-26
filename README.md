# LittleBSD
The project basead in FreeBSD with busybox to minimal setup jail.


[OS](https://gitlab.com/christianbaptista/littlebsd.git)

[BUSYBOX](https://busybox.net/)

[FreeBSD](https://freebsd.org)

[ports](https://www.freshports.org/sysutils/busybox/)


```
# git clone https://gitlab.com/christianbaptista/littlebsd.git
# cd littlebsd

# cat << EOF > /etc/jail.conf
littleBSD {
     path = "/usr/local/jails/containers/littleBSD"; ## change dir if necessary.
     exec.consolelog = "/var/log/jail_console_${name}.log";
     allow.raw_sockets;
     exec.clean;
     mount.devfs;
     host.hostname = "littleBSD";
     ip4.addr = 192.168.11.143; ## change IP
     interface = wlan0; ## change interface
     exec.start = "/bin/busybox sh";
}
EOF

# jail -c littleBSD

# jexec -u root littleBSD


# cd /bin
# ./busybox --list | ./busybox xargs -n1 ./busybox ln -s busybox

```

- [x] Enjoy!!! 


---
thanks [smallhacks](https://smallhacks.wordpress.com/2019/07/08/busybox-on-the-freebsd/)

*Dont use in production, your responsability.*


