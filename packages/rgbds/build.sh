MININIX_PKG_HOMEPAGE=https://rednex.github.io/rgbds/
MININIX_PKG_DESCRIPTION="Rednex Game Boy Development System"
MININIX_PKG_VERSION=0.3.7
MININIX_PKG_SHA256=9ffdbdf223e40b18e0e64083356092d07c268b42b78d8fd29fcc468969936a04
MININIX_PKG_SRCURL=https://github.com/rednex/rgbds/releases/download/v${MININIX_PKG_VERSION}/rgbds-${MININIX_PKG_VERSION}.tar.gz
MININIX_PKG_DEPENDS="libpng"
MININIX_PKG_BUILD_IN_SRC=true
MININIX_PKG_EXTRA_MAKE_ARGS="PREFIX=${MININIX_PREFIX} Q= STRIP="
