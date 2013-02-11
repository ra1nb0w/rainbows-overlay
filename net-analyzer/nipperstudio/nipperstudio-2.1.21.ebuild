# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nessus-bin/nessus-bin-5.0.1.ebuild,v 1.1 2012/10/06 17:35:27 pinkbyte Exp $

inherit multilib rpm

#nipperstudio-2.1.21-fedora-17-x86_64.rpm 
MY_P="${P}-fedora-17"
# We are using the Red Hat/CentOS binary

DESCRIPTION="Network Security Auditing Tool"
HOMEPAGE="https://www.titania-security.com"
SRC_URI="
	x86? ( ${MY_P}-i686.rpm )
	amd64? ( ${MY_P}-x86_64.rpm )"

RESTRICT="mirror fetch strip"

## check license
LICENSE="GPL-2 Nipper"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""

pkg_nofetch() {
		einfo "Please download ${A} from ${HOMEPAGE}/downloads"
		einfo "The archive should then be placed into ${DISTDIR}."
}

## bad way!
src_install() {
  cp -pPR "${WORKDIR}"/opt "${D}"/ 
  rm "${WORKDIR}"/usr/bin/nipper
  cp -pPR "${WORKDIR}"/usr "${D}"/
}
