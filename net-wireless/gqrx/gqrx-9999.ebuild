# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2 qt4-r2

DESCRIPTION="Software defined radio receiver powered by GNU Radio and Qt. "
HOMEPAGE="http://www.oz9aec.net/index.php/gnu-radio/gqrx-sdr"
EGIT_REPO_URI="git://github.com/csete/${PN}"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

## add use: server dsp radio
DEPEND="media-sound/pulseaudio
		net-wireless/gnuradio
		x11-libs/qt-core
		net-libs/libosmocore
		net-wireless/gr-osmosdr
		x11-libs/qt-gui"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	echo "" >> gqrx.pro
	echo "target.path = /usr/bin" >> gqrx.pro
	echo "INSTALLS += target" >> gqrx.pro
#	qmake
}
