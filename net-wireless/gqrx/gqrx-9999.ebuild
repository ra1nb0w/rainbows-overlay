# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-2 qt4-r2

DESCRIPTION="Software defined radio receiver powered by GNU Radio and Qt. "
HOMEPAGE="http://www.oz9aec.net/index.php/gnu-radio/gqrx-sdr"
EGIT_REPO_URI="git://github.com/csete/${PN}"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pulseaudio"

## add use: server dsp radio
DEPEND="pulseaudio? ( media-sound/pulseaudio )
		net-wireless/gnuradio
		dev-qt/qtcore
		net-libs/libosmocore
		net-wireless/gr-osmosdr
		dev-qt/qtgui"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	# disable pulse audio
	if use !pulseaudio; then
		sed -i 's/AUDIO_BACKEND = pulse/#AUDIO_BACKEND = pulse/' gqrx.pro
	fi
	echo "" >> gqrx.pro
	echo "target.path = /usr/bin" >> gqrx.pro
	echo "INSTALLS += target" >> gqrx.pro
#	qmake
}
