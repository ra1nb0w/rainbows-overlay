# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="nxmc"
## to be changed
## avoid: A package name may contain any of the characters [A-Za-z0-9+_-]. It must not begin with a hyphen, and must not end in a hyphen followed by one or more digits.
MY_PV="2.0-M2"
DESCRIPTION="NetXMS network monitoring system - management console"
HOMEPAGE="http://www.netxms.org/"
SRC_URI="http://www.netxms.org/download/nxmc/${MY_P}-${MY_PV}-linux-gtk-x64.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

QA_PREBUILT="/opt/${PN}/${MY_P}"

DEPEND="virtual/jdk"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
  insinto /opt/${PN}
  doins -r *
  fperms 755 /opt/${PN}/${MY_P}
  dosym /opt/${PN}/${MY_P} /opt/bin/${MY_P}
}
