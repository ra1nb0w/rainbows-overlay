# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/undotree/undotree-4.3.ebuild,v 1.1 2013/02/21 07:39:35 radhermit Exp $

EAPI=5

inherit vim-plugin git-2

DESCRIPTION="vim plugin: Collaborative Editing for Vim"
HOMEPAGE="https://github.com/FredKSchott/CoVim"
EGIT_REPO_URI="https://github.com/FredKSchott/CoVim.git"
unset SRC_URI
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
