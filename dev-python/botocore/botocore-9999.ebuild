# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2:2.7"
#PYTHON_USE_WITH="sqlite"

inherit git-2 distutils python

DESCRIPTION="A low-level interface to a growing number of Amazon Web Services."
HOMEPAGE="https://github.com/boto/botocore"
EGIT_REPO_URI="https://github.com/boto/botocore.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/python-dateutil
	dev-python/six
	dev-python/requests
	dev-python/jmespath"

RDEPEND="${DEPEND}"
