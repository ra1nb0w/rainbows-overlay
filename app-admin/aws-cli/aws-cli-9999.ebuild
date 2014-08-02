# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2:2.7"
#PYTHON_USE_WITH="sqlite"

inherit git-2 distutils python

DESCRIPTION="The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services."
HOMEPAGE="https://aws.amazon.com/cli/"
EGIT_REPO_URI="https://github.com/aws/aws-cli.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/botocore
	dev-python/bcdoc
	dev-python/six
	dev-python/colorama
	dev-python/docutils
	dev-python/rsa"

RDEPEND="${DEPEND}"
