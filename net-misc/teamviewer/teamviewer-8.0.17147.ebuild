# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/teamviewer/teamviewer-8.0.17147.ebuild,v 1.1 2013/02/20 02:39:15 hasufell Exp $

EAPI=5

inherit eutils gnome2-utils

# Major version
MV=${PV/\.*}
MY_PN=${PN}-${MV}
DESCRIPTION="All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="http://www.teamviewer.com"
SRC_URI="http://www.teamviewer.com/download/version_${MV}x/teamviewer_linux.deb -> ${P}.deb"

LICENSE="TeamViewer"
SLOT=${MV}
KEYWORDS="~amd64 ~x86"
IUSE="system-wine"

RESTRICT="mirror"

RDEPEND="
	x11-misc/xdg-utils
	app-emulation/wine"

QA_PREBUILT="opt/teamviewer-${MV}/*"

S=${WORKDIR}/opt/teamviewer${MV}/tv_bin

make_winewrapper() {
	cat << EOF > "${T}/${MY_PN}"
#!/bin/sh
export WINEDLLPATH=/opt/${MY_PN}
exec wine "/opt/${MY_PN}/TeamViewer.exe" "\$@"
EOF
	chmod go+rx "${T}/${MY_PN}"
	exeinto /opt/bin
	doexe "${T}/${MY_PN}"
}

src_unpack() {
	default
	unpack ./data.tar.gz
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-POSIX.patch \
		"${FILESDIR}"/${P}-gentoo.patch

	sed \
		-e "s/@TVV@/${MV}/g" \
		"${FILESDIR}"/${PN}d.init > "${T}"/${PN}d-${MV} || die
}

src_install () {
		make_winewrapper
		exeinto /opt/${MY_PN}
		doexe wine/drive_c/TeamViewer/*

	# install daemon binary
	exeinto /opt/${MY_PN}
	doexe ${PN}d

	doinitd "${T}"/${PN}d-${MV}

	newicon -s 48 desktop/${PN}.png ${MY_PN}.png
	dodoc ../linux_FAQ_{EN,DE}.txt
	make_desktop_entry ${MY_PN} TeamViewer ${MY_PN}
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update

		echo
		eerror "IMPORTANT NOTICE!"
		elog "Using ${PN} with system wine is not supported and experimental."
		elog "Do not report gentoo bugs while using this version."
		echo

	ewarn "STARTUP NOTICE:"
	elog "You cannot start the daemon via \"teamviewer --daemon start\"."
	elog "Instead use the provided gentoo initscript:"
	elog "  /etc/init.d/${PN}d-${MV} start"
	elog
	elog "Logs are written to \"~/.config/teamviewer8/logfiles\""
}

pkg_postrm() {
	gnome2_icon_cache_update
}
