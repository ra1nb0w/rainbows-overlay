# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/sflphone/sflphone-1.0.1.ebuild,v 1.3 2012/03/02 14:58:32 elvanor Exp $

EAPI="3"

## NOTE
## I am the maintainer of sflphone on Gentoo, where the policy is to disable
## building with shipped libraries and use system ones when available.
## check bug: https://projects.savoirfairelinux.com/issues/18763

inherit autotools eutils gnome2

DESCRIPTION="SFLphone is a robust standards-compliant enterprise softphone, for desktop and embedded systems."
HOMEPAGE="http://www.sflphone.org/"
#SRC_URI="http://www.elvanor.net/files/gentoo/${P}.tar.gz"
SRC_URI="https://projects.savoirfairelinux.com/attachments/download/5064/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doxygen gnome gsm kde networkmanager speex static-libs "

#>=net-libs/pjsip-1.8.10
CDEPEND="dev-cpp/commoncpp2
	dev-libs/dbus-c++
	dev-libs/expat
	dev-libs/openssl
	dev-libs/libpcre
	dev-libs/libyaml
	media-libs/alsa-lib
	media-libs/celt
	media-libs/libsamplerate
	media-sound/pulseaudio
	net-libs/ccrtp
	net-libs/libzrtpcpp
	sys-apps/dbus
	gsm? ( media-sound/gsm )
	speex? ( media-libs/speex )
	networkmanager? ( net-misc/networkmanager )
	gnome? ( dev-libs/atk
		dev-libs/check
		gnome-base/libgnomeui
		gnome-base/orbit:2
		media-libs/fontconfig
		media-libs/freetype
		media-libs/libart_lgpl
		net-libs/libsoup:2.4
		net-libs/webkit-gtk:3
		x11-libs/cairo
		x11-libs/libICE
		x11-libs/libnotify
		x11-libs/libSM )
	kde? ( >=sys-devel/gcc-4.6 )"

DEPEND="${CDEPEND}
		doxygen? ( app-doc/doxygen )
		gnome? ( app-text/gnome-doc-utils )"

RDEPEND="${CDEPEND}"

pkg_setup() {
	if  use gnome && use kde ; then
		die "Please disable either kde or gnome useflag."
	fi
}

src_prepare() {
	cd daemon/libs/pjproject-2.0.1
	#./configure --disable-ilbc-codec
	## why disable?
	econf --disable-ilbc-codec
	#cd daemon/libs/pjproject
	emake -j1 || die "emake failed."
	#make || die "Make failed"
}

src_configure() {

	if use gnome; then
		cd gnome
		econf $(use_enable static-libs static)
	fi

	if use kde; then
		cd kde
		./config.sh --prefix=/usr  $(use_enable static-libs static)
#		econf $(use_enable static-libs static)
	fi

	cd ../daemon
	econf --disable-dependency-tracking $(use_with debug) \
		$(use_with gsm) $(use_with networkmanager) $(use_with speex) $(use_enable static-libs static) $(use_enable doxygen)

}

src_compile() {
	cd daemon
	emake || die "emake failed."

	if use gnome; then
		cd ../gnome
		emake || die "emake failed."
	fi
	
	if use kde; then
		cd ../kde/build
		emake || die "emake failed."
	fi
}

src_install() {
	if use gnome; then
		cd gnome
		gnome2_src_install
	fi

	if use kde; then
		cd kde/build
		emake -j1 DESTDIR="${D}" install || die "emake install failed"
		cd ../
	fi

	cd ../daemon
	emake -j1 DESTDIR="${D}" install || die "emake install failed"
	dodoc test/sflphonedrc-sample

}

pkg_postinst() {
	elog
	elog "You need to restart dbus, if you want to access"
	elog "sflphoned through dbus."
	elog
	elog
	elog "If you use the command line client"
	elog "(https://projects.savoirfairelinux.com/repositories/browse/sflphone/tools/pysflphone)"
	elog "extract /usr/share/doc/${PF}/${PN}drc-sample to"
	elog "~/.config/${PN}/${PN}drc for example config."
	elog
	elog
	elog "For calls out of your browser have a look in sflphone-callto"
	elog "and sflphone-handler. You should consider to install"
	elog "the \"Telify\" Firefox addon. See"
	elog "https://projects.savoirfairelinux.com/repositories/browse/sflphone/tools"
	elog
	if use gnome; then
		gnome2_pkg_postinst
		elog
		elog "sflphone-client-gnome: To manage your contacts you need"
		elog "mail-client/evolution or access to an evolution-data-server"
		elog "connected backend."
		elog
	fi
}

