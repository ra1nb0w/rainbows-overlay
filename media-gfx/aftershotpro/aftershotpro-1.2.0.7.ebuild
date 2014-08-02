# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A raw photo workflow tool"
HOMEPAGE="http://www.corel.com/aftershotpro"
SRC_URI="
	x86? ( http://www.corel.com/akdlm/6763/downloads/AfterShotPro/1/Patches/1_2/AfterShotPro_i386.deb )
	amd64? ( http://www.corel.com/akdlm/6763/downloads/AfterShotPro/1/Patches/1_2/AfterShotPro_amd64.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"
IUSE=""
RESTRICT="mirror"

# FIXME: list is not full
RDEPEND="
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs[opengl] )"

S=${WORKDIR}

src_install() {
	tar -xzf "${WORKDIR}/data.tar.gz" -C "${D}" || die
}
