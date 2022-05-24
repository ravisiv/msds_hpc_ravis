# Spack Environment

## Compilers
Compilers used in this environment is gcc@11.2.0. Latest stable available version.

## Packages
python - version 3.8.12
py-numpy - necessary for data science
py-pandas 
py-matplotlib - Graphing packages

I had to add py-pandas and py-matplotlib seperately (I used *spack add py-matplotlib* and *spack add py-pandas*. I then got the yaml file from _~/spack/var/environments/msds/spack.yml_ file)


## Target
Target is broadwell, which is the latest Intel Xeon Chip. We can build for other environments, but broadwell is more recent.

## Specs
  A matrix of compiler, packages and targets, that it creates all the combinations of it.
  
