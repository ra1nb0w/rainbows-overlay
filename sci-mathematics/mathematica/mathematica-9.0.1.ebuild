# Copyright 2009-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cdrom eutils

DESCRIPTION="A suite for symbolical and numerical calculations."
HOMEPAGE="http://reference.wolfram.com/mathematica/"
SRC_URI=""

LICENSE="commercial"
SLOT="9.0"

RESTRICT="fetch,test,bindist"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="virtual/jre"
DEPEND="app-arch/tar"

S="${WORKDIR}"
PLATFORM_DIR="Unix"

DESTINATION="opt/wolfram/${PN}/${SLOT}"
EDESTINATION="${EROOT#/}${DESTINATION}"

QA_PREBUILT="*"

src_unpack() {
	cdrom_get_cds ${PLATFORM_DIR}/Installer/MathInstaller

	# Language to install
	# FIXME Use locales?
	InstallLanguage="English"

	# Features to install
	# FIXME Use flags to decide features
	FeatureList="Full"

	# Figure out what to install based on arch.
	SystemIDList="None"
	if use x86 ; then
		SystemIDList="${SystemIDList} Linux"
	elif use amd64 ; then
		SystemIDList="${SystemIDList} Linux-x86-64"
	else
		die "Unsupported Arch"
	fi

	InfoFileList=$(find "${CDROM_ROOT}/${PLATFORM_DIR}" -name "info" -print)
	ProductInfoFileList=$(echo "${InfoFileList}" | sed -e 's/^ //g')

	# From $ProductInfoFileList, we need to extract only the info files
	# that contain the InstallIDs from $InstallIDList, the Language
	# from $InstallLanguage, and the Feature from $InstallFeature.
	# We will call this new info file list $InstallInfoFileList.
	CreationID="0"
	#VersionNumber="${SLOT}"
	VersionNumber="1.0"
	ReleaseNumber="0"
	MinorReleaseNumber="0"
	for InfoFile in ${ProductInfoFileList} ; do
		# Check for lang support
		TestLanguage=$(awk '/^Language / {print $2}' "${InfoFile}")
		if [ "${InstallLanguage}" != "${TestLanguage}" ]; then
			#eerror "${InfoFile}: ${InstallLanguage} != ${TestLanguage}"
			continue
		fi

		# Check for sys arch support
		TestSystemID=$(awk '/^SystemID / {print $2}' "${InfoFile}")
		if [[ " ${SystemIDList} " != *" ${TestSystemID} "* ]] ; then
			#eerror "${InfoFile}: ${SystemIDList} != ${TestSystemID}"
			continue
		fi


		# Check for feature support
		TestFeatureList=$(awk '/^Feature / {print $2}' "${InfoFile}")
		if [[ " ${FeatureList} " != *" ${TestFeatureList} "* ]] ; then
			#eerror "${InfoFile}: ${FeatureList} != ${TestFeatureList}"
			continue
		fi

		# Check and set version numbers
		CreationID=$(awk -v CreationID="$CreationID" '/^CreationID / {
			if ($2 > CreationID) print $2;
			else print CreationID
		}' "${InfoFile}")

		VersionNumber=$(awk -v VersionNumber="${VersionNumber}" '/^VersionNumber / {
			if ($2 > VersionNumber) print $2; 
			else print VersionNumber
		}' "${InfoFile}")

		ReleaseNumber=$(awk -v ReleaseNumber="${ReleaseNumber}" '/^ReleaseNumber / {
			if ($2 > ReleaseNumber) print $2; 
			else print ReleaseNumber
		}' "${InfoFile}")

		MinorReleaseNumber=$(awk -v MinorReleaseNumber="${MinorReleaseNumber}" '/^MinorReleaseNumber / {
			if ($2 > MinorReleaseNumber) print $2; 
			else print MinorReleaseNumber
		}' "${InfoFile}")


		# Extract the archives for each info file.
		InfoDir=$(dirname "${InfoFile}")
		for Archive in "${InfoDir}"/*.gz ; do
			ArchiveFile=$(basename "${Archive}")
			ArchiveLocation=$(dirname "${Archive}")

			TmpFileName="$(basename ${ArchiveLocation})"
			TmpFileName="${TmpFileName}.${ArchiveFile#*.}"

			ln -sfn "${Archive}" ./"${TmpFileName}"
			unpack ./"${TmpFileName}"
			rm -f ./"${TmpFileName}"
		done
	done

	# Create version and info files.
	FullVersionNumber="${VersionNumber}.${ReleaseNumber}.${MinorReleaseNumber}"

	echo "FullVersionNumber: ${FullVersionNumber}" > "./.Revision"
	echo "CreationID: ${CreationID}" >> "./.Revision"

	echo "${CreationID}" > "./.CreationID"
	echo "${FullVersionNumber}" > "./.VersionID"

	cp "./.CreationID" ./Executables/
}

src_install() {
	#/bin/sh ${CDROM_ROOT}/${INSTALLER} -auto -execdir="${D}"/opt/bin -method="Full" -platforms=${platform} -selinux=$(use selinux && "y" || "n") -targetdir="${D}/opt" -verbose || die

	dodir "${DESTINATION}"

	# Create SymLinks
	# TODO Check and make sure this is the same for non-student editions
	dosym /"${DESTINATION}"/Executables/math /opt/bin/math
	dosym /"${DESTINATION}"/Executables/mathematica /opt/bin/mathematica
	dosym /"${DESTINATION}"/Executables/Mathematica /opt/bin/Mathematica
	dosym /"${DESTINATION}"/Executables/MathKernel /opt/bin/MathKernel
	dosym /"${DESTINATION}"/Executables/mcc /opt/bin/mcc
	dosym /"${DESTINATION}"/SystemFiles/Kernel/Binaries/Linux$(use amd64 && echo -n '-x86-64')/MathematicaScript /opt/bin/MathematicaScript

	doman SystemFiles/SystemDocumentation/Unix/* || die

	doicon SystemFiles/FrontEnd/SystemResources/X/Mathematica-128.png || die

	make_desktop_entry ${PN} "Mathematica" Mathematica-128 Education || die

	# Copy over remaining files
	cp -vf .CreationID "${D}/${DESTINATION}"
	cp -vf .Revision "${D}/${DESTINATION}"
	cp -vf .VersionID "${D}/${DESTINATION}"
	cp -Rvf * "${D}/${DESTINATION}"
} 
