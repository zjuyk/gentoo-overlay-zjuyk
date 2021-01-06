# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} pypy3)
inherit distutils-r1 git-r3

DESCRIPTION="A sexy command line interface musicbox for NetEase based on Python"
HOMEPAGE="https://github.com/darknessomi/musicbox"
SRC_URI="https://pypi.python.org/packages/source/N/NetEase-MusicBox/NetEase-MusicBox-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+local lyrics +notify search"


RDEPEND="
	media-sound/mpg123
	dev-python/fuzzywuzzy
"
PDEPEND="
	local? ( net-misc/aria2 )
	lyrics? ( dev-python/dbus-python dev-python/QtPy dev-qt/qtcore sys-apps/dbus )
	notify? ( x11-libs/libnotify )
	search? ( dev-python/python-levenshtein )
"
DEPEND="
	${RDEPEND}
	${PDEPEND}
"

python_install(){
	distutils-r1_python_install
}
