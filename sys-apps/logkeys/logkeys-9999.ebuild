# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#PYTHON_DEPEND="2:2.6"
#PYTHON_USE_WITH="sqlite"

inherit git-2 eutils

DESCRIPTION="logkeys is a linux keylogger (GNU/Linux systems only)"
HOMEPAGE="https://code.google.com/p/logkeys/"
EGIT_REPO_URI="https://code.google.com/p/logkeys/"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-devel/gcc"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

## need these files
#/etc/logkeys-start.sh
#/etc/logkeys-kill.sh
# by llk llkk
# but it's wrong to use /etc for this purpose
