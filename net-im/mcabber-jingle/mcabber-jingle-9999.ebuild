# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libosmocore/libosmocore-9999.ebuild,v 1.3 2012/08/01 23:40:13 chithanh Exp $

EAPI="5"
inherit cmake-utils

if [[ ${PV} == 9999* ]]; then
	inherit git-2
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/alkino/${PN}.git"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="This project aims to implement jingle for mcabber as a set of modules. "
HOMEPAGE="https://github.com/alkino/mcabber-jingle"

LICENSE="GPL-2+"
SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}
	net-im/mcabber"

src_prepare() {
	epatch "${FILESDIR}/${P}-gfree.patch"
}
