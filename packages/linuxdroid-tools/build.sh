LINUXDROID_PKG_HOMEPAGE=https://linuxdroid.app/
LINUXDROID_PKG_DESCRIPTION="Basic system tools for Linuxdroid"
LINUXDROID_PKG_VERSION=0.56
LINUXDROID_PKG_PLATFORM_INDEPENDENT=yes
LINUXDROID_PKG_ESSENTIAL=yes
LINUXDROID_PKG_DEPENDS="linuxdroid-am"
LINUXDROID_PKG_CONFFILES="etc/motd"

linuxdroid_step_make_install () {
	mkdir -p $LINUXDROID_PREFIX/bin/applets
	# Remove LD_LIBRARY_PATH from environment to avoid conflicting
	# with system libraries that system binaries may link against:
	for tool in df getprop logcat ping ping6 ip pm settings; do
		WRAPPER_FILE=$LINUXDROID_PREFIX/bin/$tool
		echo '#!/bin/sh' > $WRAPPER_FILE
		echo 'unset LD_LIBRARY_PATH LD_PRELOAD' >> $WRAPPER_FILE
		# Some tools require having /system/bin/app_process in the PATH,
		# at least am&pm on a Nexus 6p running Android 6.0:
		echo -n 'PATH=$PATH:/system/bin ' >> $WRAPPER_FILE
		echo "exec /system/bin/$tool \"\$@\"" >> $WRAPPER_FILE
		chmod +x $WRAPPER_FILE
	done

	cp -p $LINUXDROID_PKG_BUILDER_DIR/{dalvikvm,su,linuxdroid-fix-shebang,linuxdroid-reload-settings,linuxdroid-setup-storage,chsh,linuxdroid-open-url,linuxdroid-wake-lock,linuxdroid-wake-unlock,login,pkg,linuxdroid-open,linuxdroid-info} $LINUXDROID_PREFIX/bin/
	perl -p -i -e "s%\@LINUXDROID_PREFIX\@%${LINUXDROID_PREFIX}%g" $LINUXDROID_PREFIX/bin/dalvikvm

	cp $LINUXDROID_PKG_BUILDER_DIR/motd $LINUXDROID_PREFIX/etc/motd
	cd $LINUXDROID_PREFIX/bin
	ln -s -f linuxdroid-open xdg-open
}
