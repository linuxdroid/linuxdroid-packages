LINUXDROID_PKG_HOMEPAGE=https://www.isc.org/downloads/bind/
LINUXDROID_PKG_DESCRIPTION="Clients provided with BIND"
LINUXDROID_PKG_VERSION=9.13.3
LINUXDROID_PKG_REVISION=1
LINUXDROID_PKG_SHA256=76674cf2a3e61766aed5c7fd1ee6ed3da133a9e331b35b24f40efdf1bbac5b44
LINUXDROID_PKG_SRCURL="ftp://ftp.isc.org/isc/bind9/${LINUXDROID_PKG_VERSION}/bind-${LINUXDROID_PKG_VERSION}.tar.gz"
LINUXDROID_PKG_DEPENDS="openssl, readline, resolv-conf"
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="
--disable-linux-caps
--with-ecdsa=no
--with-gost=no
--with-gssapi=no
--with-libjson=no
--with-libtool
--with-libxml2=no
--with-openssl=$LINUXDROID_PREFIX
--with-randomdev=/dev/random
--with-readline=-lreadline
--with-eddsa=no
"

linuxdroid_step_pre_configure () {
	export BUILD_AR=ar
	export BUILD_CC=gcc
	export BUILD_CFLAGS=
	export BUILD_CPPFLAGS=
	export BUILD_LDFLAGS=
	export BUILD_RANLIB=

	_RESOLV_CONF=$LINUXDROID_PREFIX/etc/resolv.conf
	CFLAGS+=" $CPPFLAGS -DRESOLV_CONF=\\\"$_RESOLV_CONF\\\""
	LDFLAGS+=" -llog"
}

linuxdroid_step_make () {
	make -C lib/isc
	make -C lib/dns
	make -C lib/isccc
	make -C lib/isccfg
	make -C lib/bind9
	make -C lib/irs
	make -C bin/dig
	make -C bin/delv
	make -C bin/nsupdate
}

linuxdroid_step_make_install () {
	make -C lib/isc install
	make -C lib/dns install
	make -C lib/isccc install
	make -C lib/isccfg install
	make -C lib/bind9 install
	make -C lib/irs install
	make -C bin/dig install
	make -C bin/delv install
	make -C bin/nsupdate install
}
