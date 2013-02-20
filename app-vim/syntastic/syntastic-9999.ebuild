# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit vim-plugin git-2

DESCRIPTION="vim plugin: Syntastic is a syntax checking plugin that runs files through external syntax checkers"

HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2736"
EGIT_REPO_URI="git://github.com/scrooloose/syntastic"
EGIT_BRANCH="master"
unset SRC_URI

LICENSE="vim"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE="flake8"

DEPEND="
	flake8? ( >=dev-python/flake8-1.3.1 )
	"
RDEPEND="${DEPEND}"

src_install() {
	rm -R "${S}"/.git*
	rm -R "${S}"/_assets
	vim-plugin_src_install
}

VIM_PLUGIN_HELPFILES="${PN}"
