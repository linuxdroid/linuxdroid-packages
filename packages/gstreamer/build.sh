LINUXDROID_PKG_HOMEPAGE=https://gstreamer.freedesktop.org/
LINUXDROID_PKG_DESCRIPTION="Open source multimedia framework"
LINUXDROID_PKG_VERSION=1.14.4
LINUXDROID_PKG_SHA256=f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e7920afa985ffc7
LINUXDROID_PKG_SRCURL=https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${LINUXDROID_PKG_VERSION}.tar.xz
LINUXDROID_PKG_DEPENDS="glib"
LINUXDROID_PKG_DEVPACKAGE_DEPENDS="glib-dev"
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="--disable-check --disable-tests --disable-examples --disable-benchmarks --with-unwind=no --with-dw=no"

linuxdroid_step_post_make_install () {
	for BINARY in gst-inspect-1.0 gst-stats-1.0 gst-typefind-1.0 gst-launch-1.0
	    do	
		echo $BINARY
		local LIBEXEC_BINARY=$LINUXDROID_PREFIX/libexec/$BINARY
		local BIN_BINARY=$LINUXDROID_PREFIX/bin/$BINARY
		local LIB_PATH=/system/lib
		if [ ! "$LINUXDROID_ARCH_BITS" == "32" ]
		then
			LIB_PATH+=64
		fi
			
		mv $BIN_BINARY $LIBEXEC_BINARY

		cat << EOF > $BIN_BINARY
#!/bin/sh

# Avoid linker errors due to libOpenSLES.so:
LD_LIBRARY_PATH=/system/lib64/:$LINUXDROID_PREFIX/lib exec $LIBEXEC_BINARY "\$@"
EOF
		chmod +x $BIN_BINARY
	done
}
