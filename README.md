## *nextgen-pipeline*

### Overview

*Nextgen-pipeline* is a computational pipeline for genetic variant detection in
a single sample, or in a familial cohort (typically a trio, or a quad). It is a
full-featured, and scalable pipeline that is simple, and modular in its design.
Almost every step in the pipeline is done via a *Makefile* (GNU make). These
makefiles can be used on their own to accomplish common bioinformatics operations, or
they can be stung together in a shell script to compose a pipeline. *Nextgen-pipeline*
is well suited for processing large number of familiar cohorts, and has been used on
a 205-family (685 exomes) collection at Simons Foundation.

### Features
#### From BAM files to de novo germline mutations
    * BAM file(s) is input(tested for whole exome, whole genome to come)
    * Optionally process BAM files according to GATK best practices
    * Compute callable regions, and subdivide genome into bins of approximately
      equal size for parallelization
    * Call variants with a choice of GATK HaplotypeCaller, GATK HaplotypeCaller in GVCF mode, Freebayes, Platypus 
    * Apply GATK variant recalibration
    * Apply hard variant filters
    * Call de novo variants with DNMFilter (in development)
    * Validation against CEUTrio, NA12878

### Getting started

Requred sofware:
1. [GATK](https://www.broadinstitute.org/gatk/)
2. [Freebayes](https://github.com/ekg/freebayes)

