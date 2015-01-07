# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Open h.265 video codec implementation"
HOMEPAGE="http://www.libde265.org/"
SRC_URI="https://github.com/strukturag/libde265/releases/download/v${PV}/${P}.tar.gz"

LICENSE="LGPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"


src_configure() {
	econf --disable-dec265 --disable-sherlock265
}
