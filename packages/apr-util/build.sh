LINUXDROID_PKG_HOMEPAGE=https://apr.apache.org/
LINUXDROID_PKG_DESCRIPTION="Apache Portable Runtime Utility Library"
LINUXDROID_PKG_VERSION=1.6.1
LINUXDROID_PKG_SHA256=d3e12f7b6ad12687572a3a39475545a072608f4ba03a6ce8a3778f607dd0035b
LINUXDROID_PKG_SRCURL=http://apache.mirrors.spacedump.net/apr/apr-util-${LINUXDROID_PKG_VERSION}.tar.bz2
LINUXDROID_PKG_DEPENDS="apr, libexpat"
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="
ac_cv_lib_pq_PQsendQueryPrepared=no
--with-apr=$LINUXDROID_PREFIX
--without-sqlite3
"
LINUXDROID_PKG_INCLUDE_IN_DEVPACKAGE="bin/apu-1-config"
LINUXDROID_PKG_RM_AFTER_INSTALL="lib/aprutil.exp"
