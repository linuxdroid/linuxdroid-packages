LINUXDROID_PKG_HOMEPAGE=htts://github.com/tadfisher/pass-otp
LINUXDROID_PKG_DESCRIPTION="A pass extension for managing one-time-password (OTP) tokens"
LINUXDROID_PKG_MAINTAINER="Henrik Grimler @Grimler91"
LINUXDROID_PKG_VERSION=1.1.1
LINUXDROID_PKG_SHA256=edb3142ab81d70af4e6d1c7f13abebd7c349be474a3f9293d9648ee91b75b458
LINUXDROID_PKG_SRCURL=https://github.com/tadfisher/pass-otp/archive/v${LINUXDROID_PKG_VERSION}.tar.gz
LINUXDROID_PKG_BUILD_IN_SRC=yes
LINUXDROID_PKG_PLATFORM_INDEPENDENT=yes
LINUXDROID_PKG_DEPENDS="pass, oathtool"
LINUXDROID_PKG_SUGGESTS="libqrencode"
