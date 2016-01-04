# Exponential_figures
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: notarget

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.R)
Sources += $(wildcard *.pl)
Sources += $(wildcard *.raw)

canada.tsv: canada.raw canada.pl
	$(PUSH)
canada.Rout: canada.tsv

bacteria.Rout: geometric.Rout

provinces.pdf log_provinces.pdf: canada.Rout ;
provinces.png log_provinces.png: %.png: %.pdf
log_dandelion.Rout dandelion.Rout: geometric.Rout

happy.Rout sad.Rout: geometric.Rout
log_happy.Rout log_sad.Rout: geometric.Rout
rabbits.pdf log_rabbits.pdf: rabbits.Rout

######################################################################

%.R %.pl %.raw:
	/bin/cp $(Drop)/courses/exponential/$@ .

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
