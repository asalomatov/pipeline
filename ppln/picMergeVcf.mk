### 
SHELL = /bin/bash
USR = $(shell whoami)
INCLMK = ~/projects/pipeline/ppln/include.mk
include $(INCLMK)
### may override on cl
FAMCODE = 1
SUFFIX = -bin.vcf.gz
PROJ = mktest
INDIR = .
OUTDIR = .
LOGDIR = $(OUTDIR)
TMPDIR = /tmp/$(USR)/$(PROJ)
###
inFiles = $(sort $(wildcard $(INDIR)/$(FAMCODE)*$(SUFFIX)))

all: $(OUTDIR)/$(FAMCODE)-vars.vcf

$(OUTDIR)/$(FAMCODE)-vars.vcf: $(inFiles)
	mkdir -p $(LOGDIR)
	mkdir -p $(TMPDIR)
	mkdir -p $(OUTDIR)
	python $(SRCDIR)/picMergeVcf.py $(GENOMEREF) $(TMPDIR) $(PICARD) $(LOGDIR) $@ $^
	$(BGZIP) -f $@
	$(TABIX) -f -p vcf $@.gz
