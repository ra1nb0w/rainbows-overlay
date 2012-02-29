# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git eutils

DESCRIPTION="cli carddav client (for use with mutt etc.) "
HOMEPAGE="http://pycarddav.lostpackets.de"
EGIT_REPO_URI="https://github.com/geier/pycarddav.git"
SRC_URI=""

LICENSE="THE BEER-WARE LICENSE"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/vobject
		dev-python/pycurl
		dev-python/lxml
		>=dev-lang/python-2.7"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

#src_prepare(){
#	 epatch "${FILESDIR}"/${P}_sabredav.patch
#}

src_compile() { true; }

src_install(){
	dodoc pycard.conf.sample
	dobin pc_query pycardsyncer || die
}

pkg_postinst() {
	ewarn "Copy and edit the supplied pycard.conf.sample file"
	ewarn "(default location is ~/.pycard/pycard.conf)."
	ewarn "Beware that only you can access this file,"
	ewarn "if you have untrusted users on your machine,"
	ewarn "since the password is stored in cleartext."
}

