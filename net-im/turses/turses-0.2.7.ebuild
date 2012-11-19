# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils vcs-snapshot

DESCRIPTION="Command line twitter client"
HOMEPAGE="https://github.com/alejandrogomez/turses"
SRC_URI="https://github.com/alejandrogomez/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/oauth2
	dev-python/setuptools
	dev-python/tweepy
	dev-python/urwid"
RDEPEND="${DEPEND}"

DOCS="AUTHORS HISTORY.rst LICENSE README.rst"
RESTRICT_PYTHON_ABIS="3.*"
