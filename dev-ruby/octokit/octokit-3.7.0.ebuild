# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/GeoRuby/GeoRuby-2.2.1-r3.ebuild,v 1.1 2014/08/01 17:52:33 mrueg Exp $

EAPI=5

# uses ruby19 hash syntax
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_NAME="octokit"

inherit ruby-fakegem

DESCRIPTION="Ruby toolkit for the GitHub API"
HOMEPAGE="https://github.com/octokit/octokit.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
