# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twisted-web/twisted-web-14.0.2.ebuild,v 1.1 2014/11/18 03:24:40 patrick Exp $

EAPI="5"

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Command Line Interface for Apache CloudStack"
HOMEPAGE="https://pypi.python.org/pypi/cloudmonkey"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""
SLOT='0'

DEPEND="dev-python/setuptools
	dev-python/pygments
	dev-python/prettytable
	dev-python/requests
	dev-python/argcomplete"
RDEPEND="${DEPEND}"
