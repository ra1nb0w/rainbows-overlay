# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils autotools git-2

DESCRIPTION="Software Defined Radio (SDR) software"
HOMEPAGE="http://napan.ca/ghpsdr3"
EGIT_REPO_URI="git://github.com/alexlee188/${PN}"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

## x11-misc/xdg-utils use flag
## add use: server dsp radio
DEPEND="net-libs/ortp
		dev-libs/libconfig
		media-libs/codec2
		x11-libs/qt-opengl
		dev-libs/libusb
		sci-libs/fftw
		media-libs/portaudio
		media-sound/pulseaudio
		media-libs/libsamplerate
		x11-misc/xdg-utils"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	eautoreconf
}
