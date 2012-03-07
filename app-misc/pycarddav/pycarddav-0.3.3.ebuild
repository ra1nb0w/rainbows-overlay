# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2:2.7"
PYTHON_RESTRICTED_ABIS="3.* *-jython *-pypy-*"

inherit eutils

DESCRIPTION="cli carddav client (for use with mutt etc.) "
HOMEPAGE="http://pycarddav.lostpackets.de"
SRC_URI="http://pycarddav.lostpackets.de/download/${P}.tar.gz"

LICENSE="THE BEER-WARE LICENSE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/vobject
		dev-python/pycurl
		dev-python/lxml
		dev-python/pysqlite:2"
DEPEND="${RDEPEND}"

src_compile() { true; }

src_install(){
	dodoc pycard.conf.sample README.html README.rst || die
	dobin pc_query pycardsyncer || die
}

pkg_postinst() {
	ewarn "Copy and edit the supplied pycard.conf.sample file"
	ewarn "(default location is ~/.pycard/pycard.conf)."
	ewarn "Beware that only you can access this file,"
	ewarn "if you have untrusted users on your machine,"
	ewarn "since the password is stored in cleartext."
}

