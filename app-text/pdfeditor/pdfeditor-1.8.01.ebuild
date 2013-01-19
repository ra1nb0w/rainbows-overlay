# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Create, convert and edit PDF and XPS files. Cross-platform PDF and XPS Editor."
HOMEPAGE="http://code-industry.net/pdfeditor.php"
SRC_URI="http://code-industry.net/public/MasterPdfEditor-${PV}.x86_64.tar.gz"

LICENSE="Code Industry Ltd"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.8.1"
RDEPEND="${DEPEND}"

MY_P="MasterPdfEditor"
S=${WORKDIR}/${MY_P}

src_install() {
	mkdir -p "${D}"/opt/${PN} || die
	cp -a * "${D}"/opt/${PN} || die
	dosym "${D}"/opt/${PN}/pdfeditor /opt/bin/pdfeditor || die
}
