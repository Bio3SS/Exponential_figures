## This is Exponential_figures
## 3SS/exponential

current: target
-include target.mk

include makestuff/perl.def

######################################################################

# Content

vim_session:
	bash -cl "vmt"

######################################################################

### Makestuff

Sources += Makefile

######################################################################

## Content

Sources += $(wildcard *.R)
Sources += $(wildcard *.pl)
Sources += $(wildcard *.raw)

Ignore += canada.tsv
canada.tsv: canada.raw canada.pl
	$(PUSH)
canada.Rout: canada.tsv

## Stochastic comparison (3SS)
dandelion.Rout: geometric.Rout dandelion.R

## Scaling comparisons (3SS)
growth.Rout: bd.Rout growth.R

## Which one is exponential?
exponential.Rout: exponential.R
exponential.Rout.four.pdf: exponential.R

## Characteristic cool pictures (in developmen)
characteristic.Rout: characteristic.R
speed_story.Rout: characteristic.Rout speed_story.R
bacteria_scales.Rout: characteristic.Rout bacteria_scales.R
bacteria_times.Rout: characteristic.Rout bacteria_times.R

######################################################################

## Weird stuff

## Rescued in haste from wiki
moth.Rout: moth.R

## NTU simple dandelions
ntu.Rout: geometric.Rout ntu.R

######################################################################

### Older

bacteria.Rout: geometric.Rout

provinces.pdf log_provinces.pdf: canada.Rout ;
provinces.png log_provinces.png: %.png: %.pdf

fast.Rout: bd.Rout
fast_scaled.Rout: bd.Rout
decline.Rout: bd.Rout decline.R
comparison.Rout: comparison.R

happy.Rout sad.Rout: geometric.Rout
log_happy.Rout log_sad.Rout: geometric.Rout
rabbits.pdf log_rabbits.pdf: rabbits.Rout

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/wrapR.mk
-include makestuff/up.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
