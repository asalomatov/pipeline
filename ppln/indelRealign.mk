### 
#default: all
SHELL = /bin/bash
USR = $(shell whoami)
INCLMK = /nethome/asalomatov/projects/ppln/include.mk
include $(INCLMK)
### may override on cl
FAMCODE = 1
SUFFIX = -23
PROJ = mktest
INDIR = /mnt/scratch/$(USR)/bioppln/inputs
OUTDIR = /mnt/scratch/$(USR)/bioppln/$(PROJ)/outputs
LOGDIR = $(OUTDIR)
TMPDIR = /tmp/$(USR)/$(PROJ)
###
inFile = $(wildcard $(INDIR)/$(FAMCODE)*$(SUFFIX).bam)
$(info $(inBam))
o0 = $(addprefix $(OUTDIR)/, $(patsubst %$(SUFFIX).bam,%$(SUFFIX)-rlgn.bam,$(notdir $(inFile))))
$(info $(o0))

all: $(o0)

$(OUTDIR)/%$(SUFFIX)-rlgn.bam: $(INDIR)/%$(SUFFIX).bam $(INDIR)/%$(SUFFIX).bam.intervals
	mkdir -p $(OUTDIR)
	mkdir -p $(TMPDIR)
	mkdir -p $(OUTDIR)
	python $(SRCDIR)/gatkIndelRealigner.py $^ $@ $(GENOMEREF) $(MILLSINDEL) $(TMPDIR) $(GATK) $(LOGDIR)
