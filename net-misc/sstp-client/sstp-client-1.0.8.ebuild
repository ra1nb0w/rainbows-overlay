# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils linux-info user

DESCRIPTION="A client implementation of Secure Socket Tunneling Protocol (SSTP)"
HOMEPAGE="http://sstp-client.sourceforge.net/"
SRC_URI="mirror://sourceforge/sstp-client/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND=">=dev-libs/libevent-2.0.10
	dev-libs/openssl:0
	net-dialup/ppp"
RDEPEND="${DEPEND}"

CONFIG_CHECK="~NETFILTER_NETLINK"
DOCS=( AUTHORS ChangeLog DEVELOPERS INSTALL NEWS README TODO USING )

pkg_setup() {
	ebegin "Creating sstpc group and user"
	enewgroup sstpc
	enewuser  sstpc -1 -1 -1 sstpc
	eend ${?}
}

src_prepare() {
	# set proper examples dir, --docdir overriding is src_configure does not work
	sed -i -e "/^docdir/s:@PACKAGE@:${PF}/examples:" Makefile.in || die 'sed on Makefile.in failed'
}

src_configure() {
	econf \
		--enable-ppp-plugin \
		--enable-group=sstpc \
		--enable-user=sstpc \
		$(use_enable static)
}

src_install() {
	default
	prune_libtool_files --modules
}
