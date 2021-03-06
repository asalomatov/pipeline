### 
#default: all
SHELL = /bin/bash
ifdef SLURMMASTER
	SHELL=srun
	.SHELLFLAGS= -N1 --cpus-per-task=1 bash -c 
endif
$(info $(SHELL))
USR = $(shell whoami)
INCLMK = 
include $(INCLMK)
### may override on cl
PREFIX = 
SUFFIX = 
INDIR = .
OUTDIR = .
NCORES = 4
LOGDIR = $(OUTDIR)
TMPDIR = /tmp/$(USR)
###
infiles = $(wildcard $(INDIR)/$(PREFIX)*$(SUFFIX).bam)
$(info $(infiles))
o0 = $(addprefix $(OUTDIR)/, $(patsubst %.bam,%.dp.bam,$(notdir $(infiles))))
$(info $(o0))
.DELETE_ON_ERROR:

all: $(o0)

$(OUTDIR)/%$(SUFFIX).dp.bam: $(INDIR)/%$(SUFFIX).bam 
	mkdir -p $(OUTDIR)
	sambamba markdup -l 5 -t $(NCORES) $< $@
