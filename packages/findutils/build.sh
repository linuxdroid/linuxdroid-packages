LINUXDROID_PKG_HOMEPAGE=https://www.gnu.org/software/findutils/
LINUXDROID_PKG_DESCRIPTION="Utilities to find files meeting specified criteria and perform various actions on the files which are found"
LINUXDROID_PKG_VERSION=4.6.0
LINUXDROID_PKG_REVISION=2
LINUXDROID_PKG_SRCURL=https://mirrors.kernel.org/gnu/findutils/findutils-${LINUXDROID_PKG_VERSION}.tar.gz
LINUXDROID_PKG_SHA256=ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="gl_cv_func_fflush_stdin=yes SORT_SUPPORTS_Z=yes SORT=$LINUXDROID_PREFIX/bin/applets/sort"
LINUXDROID_PKG_DEPENDS="libandroid-support"
# Remove locale and updatedb which in Linuxdroid is provided by mlocate:
LINUXDROID_PKG_RM_AFTER_INSTALL="bin/locate bin/updatedb share/man/man1/locate.1 share/man/man1/updatedb.1 share/man/man5/locatedb.5"

linuxdroid_step_pre_configure() {
	# This is needed for find to implement support for the
	# -fstype parameter by parsing /proc/self/mountinfo:
	CPPFLAGS+=" -DMOUNTED_GETMNTENT1=1"
}
