# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic git-r3 toolchain-funcs

DESCRIPTION="Utility to replace a desktop background with a movie, screensaver, etc."
HOMEPAGE="https://github.com/ujjwal96/xwinwrap"
EGIT_REPO_URI="https://github.com/ujjwal96/xwinwrap.git"

LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="
	x11-base/xorg-server
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrender
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "s/gcc/$(tc-getCC)/" \
		-e "/CFLAGS=/d" \
		-e "/INCLUDE[[:space:]]=/d" \
		-e "/LIBS[[:space:]]=/d" \
		-i Makefile || die
}

src_configure() {
	default
	append-cflags -g -Wall -L /usr/lib/x86_64-linux-gnu -lX11 -lXext -lXrender
}

src_install() {
	dodoc README.md
	dobin xwinwrap
}
