# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator unpacker gnome2-utils

VERSIONS=($(get_all_version_components))
MAJOR_VERSION="${VERSIONS[0]}.${VERSIONS[2]}"
#MINOR_VERSION="$(echo ${VERSIONS[3]} | tr '[a-z]' '[A-Z]')"
REV_VERSION=".$(echo ${VERSIONS[5]#*alpha} | tr '[1-9]' '[A-I]')"
#MY_P="${PN}-${MAJOR_VERSION}.${MINOR_VERSION}"
MY_P="${PN}-${MAJOR_VERSION}"
if [ "x${REV_VERSION}" != "x." ]; then
	MY_P="${MY_P}${REV_VERSION}"
fi

DESCRIPTION="LightWorks video editor software"
HOMEPAGE="http://www.lwks.com/"
SRC_URI="${MY_P}-amd64.deb"

RESTRICT="fetch mirror"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="gnome-extra/libgsf
	media-gfx/nvidia-cg-toolkit
	media-libs/portaudio
	media-libs/tiff:3
	"

S="${WORKDIR}/"

src_install() {
	cp -R . ${D}

	# Remove installed link and add our script
	rm ${D}/usr/bin/lightworks
	newbin ${FILESDIR}/lightworks lightworks

	# There dirs can be changed by the user
	fperms a+rw /usr/share/lightworks/{Preferences,"Audio Mixes"}

	rm ${D}/control.tar.gz ${D}/data.tar.gz ${D}/debian-binary

	# Generate a machine number
	echo $((`cat /dev/urandom|od -N1 -An -i` % 2500)) >> ${D}/usr/share/lightworks/machine.num
}

pkg_postinst() { gnome2_icon_cache_update; }
pkg_preinst() { gnome2_icon_savelist; }
pkg_postrm() { gnome2_icon_cache_update; }
