#!/bin/bash

if [ ! -d "output_dir" ]; then
	echo "creating output_dir"
	mkdir output_dir
else
	[ "$(ls -A output_dir)" ] && echo "output_dir not empty, proceeding" || echo "output_dir empty, proceeding"
	
fi


if [ ! -d "workdir" ]; then
	echo "creating workdir"
	mkdir workdir
fi


if [ "$(ls -A workdir)" ]; then
	echo "workdir is not empty, terminating workflow"
	exit 1
else
	echo "workdir is empty, proceeding"
fi


### Variables
Input=input
Output=output_dir
Workdir=workdir
Database=/db


### Image execution
sudo \
/usr/bin/singularity \
run \
-B $PWD,$Input:/input,$Output:/output_dir,$Workdir:/workdir,$Database:/db \
stag.sif \
$@

