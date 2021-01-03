EAPI=7
PYTHON_COMPAT=( python3_{5,6,7,8} pypy3 )

inherit distutils-r1

DESCRIPTION="Python command-line client for tldr pages."
HOMEPAGE="https://github.com/tldr-pages/tldr-python-client"
SRC_URI="https://pypi.python.org/packages/source/t/tldr/tldr-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"


DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
"

python_test() {
   python_execute_function testing
   "${PYTHON}" setup.py test || die
}

python_install_all() {
	distutils-r1_python_install_all
}
