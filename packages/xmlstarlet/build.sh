MININIX_PKG_HOMEPAGE=http://xmlstar.sourceforge.net/
MININIX_PKG_DESCRIPTION="Command line XML toolkit"
MININIX_PKG_VERSION=1.6.1
MININIX_PKG_REVISION=2
MININIX_PKG_SRCURL=http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/${MININIX_PKG_VERSION}/xmlstarlet-${MININIX_PKG_VERSION}.tar.gz
MININIX_PKG_SHA256=15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca
MININIX_PKG_DEPENDS="libxslt"
MININIX_PKG_EXTRA_CONFIGURE_ARGS="--with-libxml-include-prefix=${MININIX_PREFIX}/include/libxml2"
MININIX_PKG_BUILD_IN_SRC=yes
