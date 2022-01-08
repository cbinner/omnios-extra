#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}

# Copyright 2022 OmniOS Community Edition (OmniOSce) Association.

. ../../lib/build.sh

PROG=asciidoc
VER=10.1.1
PKG=ooce/text/asciidoc
SUMMARY="text based documentation"
DESC="AsciiDoc - $SUMMARY"

RUN_DEPENDS_IPS="ooce/text/docbook-xsl"

SKIP_LICENCES='GPLv2'

set_arch 64

extract_licence() {
    logmsg "-- extracting licence"
    sed '1,/^## LICENSE/d' < $TMPDIR/$BUILDDIR/README.md \
        > $TMPDIR/$BUILDDIR/LICENCE
}

init
download_source $PROG $PROG $VER
extract_licence
patch_source
prep_build
python_build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
