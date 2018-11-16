#!/bin/bash
# build-all.sh - script to build all packages with a build order specified by buildorder.py

set -e -u -o pipefail

# Read settings from .linuxdroidrc if existing
test -f $HOME/.linuxdroidrc && . $HOME/.linuxdroidrc
: ${LINUXDROID_TOPDIR:="$HOME/.linuxdroid-build"}
: ${LINUXDROID_ARCH:="aarch64"}
: ${LINUXDROID_DEBUG:=""}

_show_usage () {
	echo "Usage: ./build-all.sh [-a ARCH] [-d] [-o DIR]"
	echo "Build all packages."
	echo "  -a The architecture to build for: aarch64(default), arm, i686, x86_64 or all."
	echo "  -d Build with debug symbols."
	echo "  -o Specify deb directory. Default: debs/."
	exit 1
}

while getopts :a:hdDso: option; do
case "$option" in
	a) LINUXDROID_ARCH="$OPTARG";;
	d) LINUXDROID_DEBUG='-d';;
	o) LINUXDROID_DEBDIR="$(realpath -m $OPTARG)";;
	h) _show_usage;;
esac
done
shift $((OPTIND-1))
if [ "$#" -ne 0 ]; then _show_usage; fi

if [[ ! "$LINUXDROID_ARCH" =~ ^(all|aarch64|arm|i686|x86_64)$ ]]; then
	echo "ERROR: Invalid arch '$LINUXDROID_ARCH'" 1>&2
	exit 1
fi

BUILDSCRIPT=`dirname $0`/build-package.sh
BUILDALL_DIR=$LINUXDROID_TOPDIR/_buildall-$LINUXDROID_ARCH
BUILDORDER_FILE=$BUILDALL_DIR/buildorder.txt
BUILDSTATUS_FILE=$BUILDALL_DIR/buildstatus.txt

if [ -e $BUILDORDER_FILE ]; then
	echo "Using existing buildorder file: $BUILDORDER_FILE"
else
	mkdir -p $BUILDALL_DIR
	./scripts/buildorder.py > $BUILDORDER_FILE
fi
if [ -e $BUILDSTATUS_FILE ]; then
	echo "Continuing build-all from: $BUILDSTATUS_FILE"
fi

exec >  >(tee -a $BUILDALL_DIR/ALL.out)
exec 2> >(tee -a $BUILDALL_DIR/ALL.err >&2)
trap "echo ERROR: See $BUILDALL_DIR/\${package}.err" ERR

for package_path in `cat $BUILDORDER_FILE`; do
	package=`basename $package_path`
	# Check build status (grepping is a bit crude, but it works)
	if [ -e $BUILDSTATUS_FILE ] && grep "^$package\$" $BUILDSTATUS_FILE >/dev/null; then
		echo "Skipping $package"
		continue
	fi

	echo -n "Building $package... "
	BUILD_START=`date "+%s"`
	bash -x $BUILDSCRIPT -a $LINUXDROID_ARCH -s \
	        $LINUXDROID_DEBUG ${LINUXDROID_DEBDIR+-o $LINUXDROID_DEBDIR} $package \
	        > $BUILDALL_DIR/${package}.out 2> $BUILDALL_DIR/${package}.err
	BUILD_END=`date "+%s"`
	BUILD_SECONDS=$(( $BUILD_END - $BUILD_START ))
	echo "done in $BUILD_SECONDS"

	# Update build status
	echo "$package" >> $BUILDSTATUS_FILE
done

# Update build status
rm -f $BUILDSTATUS_FILE
echo "Finished"
