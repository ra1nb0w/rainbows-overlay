# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 eutils

DESCRIPTION="Maildirarc is a tool for archiving a given set of Maildir folders"
HOMEPAGE="https://github.com/tdb/maildirarc"
EGIT_REPO_URI="https://github.com/tdb/maildirarc.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Email-Address
		>=dev-lang/perl-5.12
		dev-perl/TimeDate
		virtual/perl-Getopt-Long"
DEPEND="${RDEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_install(){
	dodoc README.md
	dobin maildirarc
}
