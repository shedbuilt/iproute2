#!/bin/bash
# Prevent installation of docs for arpd, which won't be installed
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
sed -i 's/m_ipt.o//' tc/Makefile
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" DOCDIR=/usr/share/doc/iproute2-4.15.0 install
