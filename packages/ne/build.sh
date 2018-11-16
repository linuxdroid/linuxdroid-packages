LINUXDROID_PKG_HOMEPAGE=http://ne.di.unimi.it/
LINUXDROID_PKG_DESCRIPTION="Easy-to-use and powerful text editor"
LINUXDROID_PKG_MAINTAINER="David Martínez @vaites"
LINUXDROID_PKG_VERSION=3.1.2
LINUXDROID_PKG_SHA256=31710ce07d6134355f311b249dcd0a8c99c0075b377bbb78a99ee1338d00c6a3
LINUXDROID_PKG_SRCURL=https://fossies.org/linux/misc/ne-${LINUXDROID_PKG_VERSION}.tar.xz
LINUXDROID_PKG_DEPENDS="libandroid-support, ncurses"
LINUXDROID_PKG_RM_AFTER_INSTALL="info/"
LINUXDROID_PKG_BUILD_IN_SRC=yes

linuxdroid_step_pre_configure() {
	export OPTS="$CFLAGS $CPPFLAGS"
}
