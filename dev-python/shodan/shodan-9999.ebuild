# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twisted-web/twisted-web-14.0.2.ebuild,v 1.1 2014/11/18 03:24:40 patrick Exp $

EAPI="5"

#PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit git-2 distutils-r1
#inherit git-2 distutils python

DESCRIPTION="The official Python library for Shodan "
EGIT_REPO_URI="https://github.com/achillean/shodan-python.git"

KEYWORDS="~amd64 ~x86"
LICENSE="BSD"
IUSE=""
SLOT='0'

DEPEND=""
RDEPEND="${DEPEND}"
