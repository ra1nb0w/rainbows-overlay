# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/arping/arping-2.09-r1.ebuild,v 1.1 2010/09/15 01:33:35 jer Exp $

EAPI="2"

DESCRIPTION="Tools to work with the Cisco Discovery Protocol (CDP)"
HOMEPAGE="http://gpl.internetconnection.net/"
SRC_URI="http://gpl.internetconnection.net/files/cdp-tools.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="net-libs/libpcap
		net-libs/libnet"

S="${WORKDIR}/${PN}"

src_install() {
	dosbin cdp-listen cdp-send || die
	dodoc README CHANGELOG
}

pkg_postinst() {
	echo
	einfo "Great tutorial located at:"
	einfo "http://openmaniak.com/cdp.php"
	echo
}
