#!/bin/sh
#
# $Id: autogen.sh,v 1.2 2004/08/20 21:22:34 bazsi Exp $
#
# This script is needed to setup build environment from checked out
# source tree. 
#

origdir=`pwd`

for i in . modules/afmongodb/libmongo-client; do
	echo "Running autogen in '$i'..."
	cd "$i"
	libtoolize --force
	aclocal -I m4 --install
	sed -i -e 's/PKG_PROG_PKG_CONFIG(\[0\.16\])/PKG_PROG_PKG_CONFIG([0.14])/g' aclocal.m4

	autoheader
	automake --foreign --add-missing
	autoconf
	cd "$origdir"
done
