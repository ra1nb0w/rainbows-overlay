# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libosmocore/libosmocore-9999.ebuild,v 1.3 2012/08/01 23:40:13 chithanh Exp $

EAPI="4"
inherit autotools

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	SRC_URI=""
	EGIT_REPO_URI="git://git.osmocom.org/${PN}.git"
	KEYWORDS="~amd64 ~x86"
else
	SRC_URI="http://cgit.osmocom.org/cgit/libosmocore/snapshot/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A library with SDR DSP primitives."
HOMEPAGE="http://cgit.osmocom.org/cgit/libosmo-dsp/"

LICENSE="GPL-2 LGPL-3"
SLOT="0"
IUSE="embedded"

RDEPEND=""
DEPEND="${RDEPEND}
	app-doc/doxygen"

src_prepare() {
	# set correct version in pkgconfig files
	sed -i "s/UNKNOWN/${PV}/" git-version-gen || die
	eautoreconf
}

src_configure() {
	econf $(use_enable embedded)
}

#src_install() {
#	default
	# install to correct documentation directory
#	mv "${ED}"/usr/share/doc/${PN} "${ED}"/usr/share/doc/${PF} || die
#}
