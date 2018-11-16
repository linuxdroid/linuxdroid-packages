LINUXDROID_PKG_HOMEPAGE=https://openvpn.net
LINUXDROID_PKG_DESCRIPTION="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network)"
LINUXDROID_PKG_VERSION=2.4.2
LINUXDROID_PKG_DEPENDS="openssl, liblzo, net-tools"
LINUXDROID_PKG_SRCURL=https://swupdate.openvpn.net/community/releases/openvpn-${LINUXDROID_PKG_VERSION}.tar.xz
LINUXDROID_PKG_SHA256=df5c4f384b7df6b08a2f6fa8a84b9fd382baf59c2cef1836f82e2a7f62f1bff9
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="
--disable-plugin-auth-pam
--disable-systemd
--disable-debug
--enable-iproute2
--enable-small
--enable-x509-alt-username
ac_cv_func_getpwnam=yes
ac_cv_func_getpass=yes
IFCONFIG=$LINUXDROID_PREFIX/bin/ifconfig
ROUTE=$LINUXDROID_PREFIX/bin/route
IPROUTE=$LINUXDROID_PREFIX/bin/ip
NETSTAT=$LINUXDROID_PREFIX/bin/netstat"
LINUXDROID_PKG_MAINTAINER="Vishal Biswas @vishalbiswas"

linuxdroid_step_pre_configure () {
    # need to provide getpass, else you "can't get console input"
    cp "$LINUXDROID_PKG_BUILDER_DIR/netbsd_getpass.c" "$LINUXDROID_PKG_SRCDIR/src/openvpn/"

#    CFLAGS="$CFLAGS -DTARGET_ANDROID"
    LDFLAGS="$LDFLAGS -llog "
}

linuxdroid_step_post_make_install () {
    # helper script
    install -m700 "$LINUXDROID_PKG_BUILDER_DIR/linuxdroid-openvpn" "$LINUXDROID_PREFIX/bin/"
    # Install examples
    install -d -m755 "$LINUXDROID_PREFIX/share/openvpn/examples"
    cp "$LINUXDROID_PKG_SRCDIR"/sample/sample-config-files/* "$LINUXDROID_PREFIX/share/openvpn/examples"
}
