# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2:2.7"
#PYTHON_USE_WITH="sqlite"

inherit git-2 distutils python

DESCRIPTION="Mininet: Rapid Prototyping for Software Defined Networks"
HOMEPAGE="http://www.mininet.org"
EGIT_REPO_URI="https://github.com/mininet/mininet.git"

## to check
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


#    if [ "$DIST" = "Fedora" ]; then
#        $install gcc make socat psmisc xterm openssh-clients iperf \
#            iproute telnet python-setuptools libcgroup-tools \
#            ethtool help2man pyflakes pylint python-pep8
#    else
#        $install gcc make socat psmisc xterm ssh iperf iproute telnet \
#            python-setuptools cgroup-bin ethtool help2man \
#            pyflakes pylint pep8
#    fi
DEPEND="net-misc/openvswitch"

RDEPEND="${DEPEND}"
