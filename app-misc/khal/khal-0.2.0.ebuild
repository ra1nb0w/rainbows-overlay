# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

#PYTHON_COMPAT=( python{2_7} )
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
PYTHON_DEPEND="2:2.7"
PYTHON_USE_WITH="sqlite"

inherit distutils

DESCRIPTION="CLI calendar application build around CalDAV."
HOMEPAGE="https://github.com/geier/khal"
SRC_URI="https://github.com/geier/khal/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

DEPEND=">=dev-python/lxml-3.0.0
	dev-python/requests
	>=dev-python/urwid-1.1.0
	dev-python/pyxdg
	>=dev-python/icalendar-3.1
	dev-lang/python[sqlite]
	dev-python/keyring"
RDEPEND="${DEPEND}"

EXAMPLES=( khal.conf.sample )

pkg_postinst() {
	ewarn "Copy and edit the supplied khal.conf.sample file"
	ewarn "(default location is ~/.config/khal/khal.conf)."
	ewarn "Beware that only you can access this file,"
	ewarn "if you have untrusted users on your machine,"
	ewarn "since the password is stored in cleartext."
}
