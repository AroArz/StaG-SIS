#!/bin/bash

### Variables

Home=$PWD
Input=/input
Output=/output_dir
Database=/db
Workdir=/workdir

export SINGULARITY_CACHEDIR=$Output 

### Cloning repository

cd /workdir
git clone --branch develop https://github.com/AroArz/stag-mwc .

### Running Snakemake

cd /workdir
snakemake \
	--use-singularity \
	--singularity-args \
	"--fakeroot --net -B $Input,$Output,$Workdir,$Database" \
	$@

### Changing permission of files
#chmod -R 777 /output_dir
#chmod -R 777 /workdir  
