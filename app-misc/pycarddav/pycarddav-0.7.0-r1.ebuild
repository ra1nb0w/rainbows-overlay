# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_USE_WITH="sqlite"

inherit distutils-r1

MY_PN="pyCardDAV"

DESCRIPTION="pyCardDAV is a simple to use CardDAV CLI client with mutt
support."
HOMEPAGE="http://lostpackets.de/pycarddav/"
SRC_URI="https://lostpackets.de/pycarddav/downloads/${MY_PN}-${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

DEPEND="dev-python/lxml
	dev-python/requests
	dev-python/urwid
	dev-python/vobject
	dev-python/pyxdg"
RDEPEND="${DEPEND}"

EXAMPLES=( pycard.conf.sample )
DOCS=( README.rst NEWS.txt )

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	distutils-r1_src_install
	doman doc/man/*.1
}

pkg_postinst() {
	ewarn "Copy and edit the supplied pycard.conf.sample file"
	ewarn "(default location is ~/.config/pycard/pycard.conf)."
	ewarn "Beware that only you can access this file,"
	ewarn "if you have untrusted users on your machine,"
	ewarn "since the password is stored in cleartext."
}
