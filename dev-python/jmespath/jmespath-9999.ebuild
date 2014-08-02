# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2:2.7"
#PYTHON_USE_WITH="sqlite"

inherit git-2 distutils python

DESCRIPTION="JMESPath allows you to declaratively specify how to extract elements from a JSON document."
HOMEPAGE="https://github.com/boto/jmespath"
EGIT_REPO_URI="https://github.com/boto/jmespath.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"
