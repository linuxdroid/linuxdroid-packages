MININIX_PKG_HOMEPAGE=https://mosquitto.org/
MININIX_PKG_DESCRIPTION="MQTT library"
MININIX_PKG_VERSION=1.5.4
MININIX_PKG_SHA256=5fd7f3454fd6d286645d032bc07f44a1c8583cec02ef2422c9eb32e0a89a9b2f
MININIX_PKG_SRCURL=https://mosquitto.org/files/source/mosquitto-${MININIX_PKG_VERSION}.tar.gz
MININIX_PKG_DEPENDS="c-ares, openssl"
MININIX_PKG_MAINTAINER="Nathaniel Wesley Filardo @nwf"
MININIX_PKG_EXTRA_CONFIGURE_ARGS="
-DWITH_THREADING=OFF
-DWITH_TLS_PSK=OFF"
