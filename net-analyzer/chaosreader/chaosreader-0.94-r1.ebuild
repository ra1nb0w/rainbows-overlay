# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/chaosreader/chaosreader-0.94.ebuild,v 1.6 2010/05/26 16:11:43 abcd Exp $

EAPI="2"

inherit eutils

DESCRIPTION="A tool to trace TCP/UDP/... sessions and fetch application data from snoop or tcpdump logs."
HOMEPAGE="http://www.brendangregg.com/chaosreader.html"
SRC_URI="http://dev.gentoo.org/~spock/portage/distfiles/${P}.bz2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86 ~amd64-linux ~x86-linux ~x86-macos"
LICENSE="GPL-2"
IUSE=""
DEPEND=">=dev-lang/perl-5.10.0"
S=${WORKDIR}

src_prepare() {
	epatch "${FILESDIR}"/chaosreader-0.94-chunkcheck.patch
	epatch "${FILESDIR}"/chaosreader-0.94-darwin.patch
	epatch "${FILESDIR}"/chaosreader-0.94-divisionbyzero.patch
	epatch "${FILESDIR}"/chaosreader-0.94-oldmultiline.patch
	epatch "${FILESDIR}"/chaosreader-0.94-zombies.patch
}

src_install() {
	newbin ${P} chaosreader || die
}
