# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} pypy3)
inherit distutils-r1

DESCRIPTION="A sexy command line interface musicbox for NetEase based on Python"
HOMEPAGE="https://github.com/darknessomi/musicbox"
MY_P="${P/_alpha/a}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+local lyrics +notify search"


RDEPEND="
	media-sound/mpg123
	dev-python/fuzzywuzzy[${PYTHON_USEDEP}]
"
PDEPEND="
	local? ( net-misc/aria2 )
	lyrics? ( dev-python/dbus-python[${PYTHON_USEDEP}] dev-python/QtPy[${PYTHON_USEDEP}] dev-qt/qtcore sys-apps/dbus )
	notify? ( x11-libs/libnotify )
	search? ( dev-python/python-levenshtein[${PYTHON_USEDEP}] )
"
DEPEND="
	${RDEPEND}
	${PDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
