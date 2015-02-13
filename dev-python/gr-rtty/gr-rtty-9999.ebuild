# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/twisted-web/twisted-web-14.0.2.ebuild,v 1.1 2014/11/18 03:24:40 patrick Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_4} )

inherit git-2 cmake-utils

DESCRIPTION="RTTY decoder for Gnuradio"
EGIT_REPO_URI="https://github.com/bistromath/gr-rtty.git"

KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT='0'

DEPEND=""
RDEPEND="${DEPEND}"

#python_prepare_all() {
#	if [[ "${EUID}" -eq 0 ]]; then
#		# Disable tests failing with root permissions.
#		sed -e "s/test_forbiddenResource/_&/" -i twisted/web/test/test_static.py
#		sed -e "s/testDownloadPageError3/_&/" -i twisted/web/test/test_webclient.py
#	fi
#
#	distutils-r1_python_prepare_all
#}
# testsuite has a PYTHONPATH oddity, currently appears to require a system install to effectively import,
# putting in question as to whether it is a testsuite
