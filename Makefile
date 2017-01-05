# Exponential_figures
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: exponential.Rout.pdf 

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

## Some stochastic stuff here
dandelion.Rout: geometric.Rout dandelion.R

exponential.Rout.pdf:

exponential.Rout.four.pdf: exponential.R

## Rescued in haste from wiki
moth.Rout: moth.R

## NTU simple dandelions
ntu.Rout: geometric.Rout ntu.R

### Older

bacteria.Rout: geometric.Rout

provinces.pdf log_provinces.pdf: canada.Rout ;
provinces.png log_provinces.png: %.png: %.pdf

growth.Rout: bd.Rout growth.R
fast.Rout: bd.Rout
fast_scaled.Rout: bd.Rout

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
-include $(ms)/up.mk
# -include $(ms)/oldlatex.mk
