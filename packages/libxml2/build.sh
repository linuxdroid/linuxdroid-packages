MININIX_PKG_HOMEPAGE=http://www.xmlsoft.org
MININIX_PKG_DESCRIPTION="Library for parsing XML documents"
MININIX_PKG_VERSION=2.9.8
MININIX_PKG_SHA256=0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732
MININIX_PKG_SRCURL=ftp://xmlsoft.org/libxml2/libxml2-${MININIX_PKG_VERSION}.tar.gz
MININIX_PKG_EXTRA_CONFIGURE_ARGS="--without-python"
MININIX_PKG_RM_AFTER_INSTALL="share/gtk-doc"
MININIX_PKG_INCLUDE_IN_DEVPACKAGE="bin/xml2-config share/man/man1/xml2-config.1 lib/cmake lib/xml2Conf.sh"
MININIX_PKG_DEPENDS="liblzma"
