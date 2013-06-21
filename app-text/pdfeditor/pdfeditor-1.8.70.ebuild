# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="MasterPdfEditor"
DESCRIPTION="Create, convert and edit PDF and XPS files"
HOMEPAGE="http://code-industry.net/pdfeditor.php"
SRC_URI="http://code-industry.net/public/${MY_P}-${PV}.x86_64.tar.gz"

LICENSE="CodeIndustry"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

QA_PREBUILT="/opt/${PN}/pdfeditor"

DEPEND=">=dev-qt/qtcore-4.8.1:4"
RDEPEND="${DEPEND}"

## temporary fix
MY_P="MasterPDFEditor"
S=${WORKDIR}/${MY_P}

src_install() {
  insinto /opt/${PN}
  doins -r *
  fperms 755 /opt/${PN}/pdfeditor
  dosym /opt/${PN}/pdfeditor /opt/bin/pdfeditor
}
