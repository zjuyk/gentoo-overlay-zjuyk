# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Utility to replace a desktop background with a movie, screensaver, etc."
HOMEPAGE="https://github.com/ujjwal96/xwinwrap"
EGIT_REPO_URI="https://github.com/ujjwal96/xwinwrap.git"

LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-base/xorg-server
	x11-libs/libXext
	x11-libs/libXrender
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

src_install() {
	dobin xwinwrap
}
