# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 toolchain-funcs

DESCRIPTION="A small tool for X11 that writes the color value on your screen at the cursor position to stdout, in RGB."
HOMEPAGE="https://github.com/ym1234/colorpicker"
EGIT_REPO_URI="https://github.com/ym1234/colorpicker.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "s/cc/$(tc-getCC)/" -i Makefile || die
}


src_install() {
	dobin colorpicker
}
