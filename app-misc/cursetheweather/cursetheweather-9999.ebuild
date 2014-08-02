# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="3:3.2"
PYTHON_USE_WITH="ncurses"
SUPPORT_PYTHON_ABIS="3.*"
RESTRICT_PYTHON_ABIS="2.*"

inherit distutils git-2

#MY_P="CurseTheWeather-${PV}"

DESCRIPTION="An ncurses-based weather forecast program"
HOMEPAGE="https://github.com/tdy/ctw"
EGIT_REPO_URI="https://github.com/tdy/ctw.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#S=${WORKDIR}/${MY_P}
