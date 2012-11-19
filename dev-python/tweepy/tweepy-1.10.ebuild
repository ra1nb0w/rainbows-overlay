# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils vcs-snapshot

DESCRIPTION="A Python library for accessing the Twitter API "
HOMEPAGE="http://tweepy.github.com/"
SRC_URI="https://github.com/tweepy/${PN}/tarball/${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="CONTRIBUTORS LICENSE README"
RESTRICT_PYTHON_ABIS="3.*"

src_install() {
	distutils_src_install

	if use examples; then
		docinto examples
		dodoc examples/*
	fi
}
