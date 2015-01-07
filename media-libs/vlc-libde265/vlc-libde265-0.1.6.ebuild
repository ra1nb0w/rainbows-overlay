# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Standalone plugin for VLC 2.x to support decoding of HEVC/H.265 using libde265"
HOMEPAGE=""
SRC_URI="https://github.com/strukturag/vlc-libde265/releases/download/0.1.6/vlc-libde265-0.1.6.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=media-video/vlc-2.1"
RDEPEND="${DEPEND}"

#src_install() {
#	dolib /usr/lib64/vlc/plugins/demux
#}
