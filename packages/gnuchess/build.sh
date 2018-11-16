LINUXDROID_PKG_HOMEPAGE=https://www.gnu.org/software/chess/
LINUXDROID_PKG_DESCRIPTION="Chess-playing program"
LINUXDROID_PKG_VERSION=6.2.5
LINUXDROID_PKG_SRCURL=https://mirrors.kernel.org/gnu/chess/gnuchess-${LINUXDROID_PKG_VERSION}.tar.gz
LINUXDROID_PKG_SHA256=9a99e963355706cab32099d140b698eda9de164ebce40a5420b1b9772dd04802
LINUXDROID_PKG_DEPENDS="ncurses, readline"
LINUXDROID_PKG_RM_AFTER_INSTALL="bin/gnuchessu bin/gnuchessx"
