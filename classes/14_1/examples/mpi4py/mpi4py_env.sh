#!/usr/bin/env bash

# Remove environment
if [[ -d ~/.venv/mpi4py ]]; then
  rm -rf ~/.venv/mpi4py
fi

# Load environment and proper MPI
module purge
module load gcc-9.2.lua python-3.8.6-gcc-9.2.0-7vsoogc hpcx/hpcx-mt

# Setup Python environment
python3 -m venv ~/.venv/mpi4py
source ~/.venv/mpi4py/bin/activate

# Install packages
pip install -U pip wheel setuptools
pip install --force-reinstall --no-binary :all: --compile mpi4py

# Run benchmark
srun --mpi=pmix --mem=1G -N 2 --ntasks-per-node=1 python3 osu_bw.py

