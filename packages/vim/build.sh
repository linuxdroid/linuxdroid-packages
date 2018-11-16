LINUXDROID_PKG_HOMEPAGE=https://www.vim.org
LINUXDROID_PKG_DESCRIPTION="Vi IMproved - enhanced vi editor"
LINUXDROID_PKG_DEPENDS="ncurses, vim-runtime"
# vim should only be updated every 50 releases on multiples of 50.
# Update both vim and vim-python to the same version in one PR.
LINUXDROID_PKG_VERSION=8.1.0518
LINUXDROID_PKG_SHA256=36988911a0399a77c2b9874655b3a08915b804c2d8890c1abb4b1242c48c95fc
LINUXDROID_PKG_SRCURL="https://github.com/vim/vim/archive/v${LINUXDROID_PKG_VERSION}.tar.gz"
LINUXDROID_PKG_EXTRA_CONFIGURE_ARGS="
vim_cv_getcwd_broken=no
vim_cv_memmove_handles_overlap=yes
vim_cv_stat_ignores_slash=no
vim_cv_terminfo=yes
vim_cv_tgetent=zero
vim_cv_toupper_broken=no
vim_cv_tty_group=world
--enable-gui=no
--enable-multibyte
--with-features=huge
--without-x
--with-tlib=ncursesw
"
LINUXDROID_PKG_BUILD_IN_SRC="yes"
LINUXDROID_PKG_RM_AFTER_INSTALL="
bin/rview
bin/rvim
bin/ex
share/man/man1/evim.1
share/icons
share/vim/vim81/spell/en.ascii*
share/vim/vim81/print
share/vim/vim81/tools
"
LINUXDROID_PKG_CONFFILES="share/vim/vimrc"

LINUXDROID_PKG_CONFLICTS="vim-python"

linuxdroid_step_pre_configure () {
	make distclean

	# Remove eventually existing symlinks from previous builds so that they get re-created
	for b in rview rvim ex view vimdiff; do rm -f $LINUXDROID_PREFIX/bin/$b; done
	rm -f $LINUXDROID_PREFIX/share/man/man1/view.1
}

linuxdroid_step_post_make_install () {
	cp $LINUXDROID_PKG_BUILDER_DIR/vimrc $LINUXDROID_PREFIX/share/vim/vimrc

	# Remove most tutor files:
	cp $LINUXDROID_PREFIX/share/vim/vim81/tutor/{tutor,tutor.vim,tutor.utf-8} $LINUXDROID_PKG_TMPDIR/
	rm -f $LINUXDROID_PREFIX/share/vim/vim81/tutor/*
	cp $LINUXDROID_PKG_TMPDIR/{tutor,tutor.vim,tutor.utf-8} $LINUXDROID_PREFIX/share/vim/vim81/tutor/

	cd $LINUXDROID_PREFIX/bin
	ln -f -s vim vi
}
