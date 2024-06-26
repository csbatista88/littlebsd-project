#!/bin/sh



BASE_DIR=/usr/local/

BUSYBOX_DIR=/usr/local/bin/busybox

fn_create_infra() {
	JAIL_NAME=$1
	sysrc jail_enable="YES"
	mkdir -p $BASE_DIR/jails/{containers,media,templates}
	if [ -e $BUSYBOX_DIR ] ; then
		echo 'busybox installed'
	else
		pkg install -y busybox
	fi
	mkdir -p $BASE_DIR/jails/containers/$JAIL_NAME
	cd $BASE_DIR/jails/containers/$JAIL_NAME
	mkdir bin etc lib libexec dev root
	## copy libs
	cp /lib/libc.so.7 lib/
	cp /lib/libcrypt.so.5 lib/
	cp /lib/libm.so.5 lib/
	cp /libexec/ld-elf.so.1 libexec/
	## copy busybox
	cp /usr/local/bin/busybox/ bin/
	## copy etc
	cp /etc/passwd etc/
	cp /etc/pwd.db etc/
	
}

fn_usage() {
	cat <<-"EOF"
        Usage: ./script.sh jail_name
         
	EOF
}


##parsing values

if [ $# -lt 1 ]; then
fn_usage;
exit 1
fi


#first start

doas jexec -u root $JAIL_NAME /bin/busybox sh
