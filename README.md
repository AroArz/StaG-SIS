# StaG - Singularity in Singularity
This repo contains the essentials for you to run StaG with only one dependency, namely [Singularity](https://sylabs.io/). [StaG](https://github.com/ctmrbio/stag-mwc) is a workflow processing metagenomic samples through several analysis tools, and is here available as a singularity in singularity container. Full StaG documentation is available [here](https://stag-mwc.readthedocs.org/).

### Requirements

1. Singularity
2. Sudo access for Singularity

### What do the files mean?
`startscript.sh` initiates the first container layer `stag.sif`, which only contains Singularity and Snakemake, with correct bind paths. `stag.sif` will open in your `$PWD` and run `runscript.sh`. `runscript.sh` contains the second layer of path variables and will initiate the snakemake workflow. Because Singularity in Singularity is only executable as root, all files managed through the container will have restricted permissions. At the end of the workflow permissions in `/workdir` and `/output_dir` is changed to `777`.

### How do I get started?
1. Build the image.

```
sudo singularity build stag.sif stag.def
```
2. Your input directory should be located in the same directory and named `input`.

3. `bash startscript.sh --dryrun`


### good to know/to be addressed
1. If you've performed a `--dryrun` make sure you `rm -rvf workdir/` before starting another run.
2. If you want to run with different parameters `stag.sif` or `stag.def` need to be manually tweaked. It is possible to shell into the image with `--writable`, clone the repository and edit `stag-mwc/config.yaml`.
3. All commands from the image are executed as `sudo` so don't do anything crazy.


