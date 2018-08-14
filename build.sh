#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
# Prevent installation of docs for arpd, which won't be installed
sed -i /ARPD/d Makefile &&
rm -fv man/man8/arpd.8 &&
# Disable building a module that depends on iptables
sed -i 's/m_ipt.o//' tc/Makefile &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" DOCDIR="$SHED_PKG_DOCS_INSTALL_DIR" install || exit 1
# Optionally remove documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}"
fi
