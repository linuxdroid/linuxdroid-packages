LINUXDROID_PKG_HOMEPAGE=https://www.mpfr.org/
LINUXDROID_PKG_DESCRIPTION="C library for multiple-precision floating-point computations with correct rounding"
LINUXDROID_PKG_DEPENDS="libgmp"
LINUXDROID_PKG_VERSION=4.0.1
LINUXDROID_PKG_REVISION=1
LINUXDROID_PKG_SRCURL=https://mirrors.kernel.org/gnu/mpfr/mpfr-${LINUXDROID_PKG_VERSION}.tar.xz
LINUXDROID_PKG_SHA256=67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="ac_cv_header_locale_h=no"
