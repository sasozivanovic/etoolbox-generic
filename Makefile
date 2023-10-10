PACKAGE = etoolbox-generic
VERSION = 2.5k
YEAR = 2023
MONTH = 10
DAY = 10

FORMAT = generic

GENERIC = etoolbox-generic.tex
CTAN = $(RUNTIME)

README = README.md
LICENCE = LICENCE

ctan/$(PACKAGE).zip:
# First check if VERSION matches the etoolbox.sty version.
	@if ! grep $(subst .,\.,$(VERSION)) README.md >/dev/null ; then echo Version mismatch with etoolbox.sty in README.md ; false ; fi
	@if ! grep 'etoolbox.sty .* v$(subst .,\.,$(VERSION))' etoolbox-generic.tex >/dev/null ; then echo Version mismatch with etoolbox.sty in etoolbox-generic.tex ; false ; fi
	$(MAKE-CTAN)

version:
	sed -i '1c % etoolbox-generic.tex $(YEAR)/$(MONTH)/$(DAY) v$(VERSION)' etoolbox-generic.tex

include Makefile.package
