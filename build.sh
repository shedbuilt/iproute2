#!/bin/bash
sed -i /ARPD/d Makefile
sed -i 's/arpd.8//' man/man8/Makefile
rm -v doc/arpd.sgml
sed -i 's/m_ipt.o//' tc/Makefile
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} DOCDIR=/usr/share/doc/iproute2-4.12.0 install
