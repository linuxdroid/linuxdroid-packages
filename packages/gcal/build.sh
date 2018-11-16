LINUXDROID_PKG_HOMEPAGE=https://www.gnu.org/software/gcal/
LINUXDROID_PKG_DESCRIPTION="Program for calculating and printing calendars"
LINUXDROID_PKG_VERSION=4.1
LINUXDROID_PKG_REVISION=2
LINUXDROID_PKG_SHA256=91b56c40b93eee9bda27ec63e95a6316d848e3ee047b5880ed71e5e8e60f61ab
LINUXDROID_PKG_SRCURL=https://mirrors.kernel.org/gnu/gcal/gcal-${LINUXDROID_PKG_VERSION}.tar.xz
LINUXDROID_PKG_DEPENDS="ncurses"
LINUXDROID_PKG_KEEP_INFOPAGES=yes

linuxdroid_step_post_make_install() {
	# XXX: share/info/dir is currently included in emacs.
	# We should probably make texinfo regenerate that file
	# just as the man package does with the man database.
	rm -f $LINUXDROID_PREFIX/share/info/dir
}
