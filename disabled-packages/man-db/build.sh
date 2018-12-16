MININIX_PKG_HOMEPAGE=http://www.nongnu.org/man-db/
MININIX_PKG_DESCRIPTION="Utilities for examining on-line help files (manual pages)"
MININIX_PKG_VERSION=2.7.5
MININIX_PKG_REVISION=1
MININIX_PKG_SRCURL=http://mirror.csclub.uwaterloo.ca/nongnu/man-db/man-db-${MININIX_PKG_VERSION}.tar.xz
MININIX_PKG_EXTRA_CONFIGURE_ARGS="--with-db=gdbm --with-pager=less --with-config-file=/data/data/mini.nix/home/usr/etc/man_db.conf --disable-setuid --with-browser=lynx --with-gzip=gzip --with-systemdtmpfilesdir=/data/data/mini.nix/home/usr/lib/tmpfiles.d"
MININIX_PKG_DEPENDS="flex, gdbm, groff, less, libandroid-support, libpipeline, lynx"

export GROFF_TMAC_PATH="/data/data/mini.nix/home/usr/lib/groff/site-tmac:/data/data/mini.nix/home/usr/share/groff/site-tmac:/data/data/mini.nix/home/usr/share/groff/current/tmac"
