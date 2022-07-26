#!/usr/bin/env bash

# Setup environment
module purge
module load nvhpc-21.9

# Get repository
git clone --depth 1 https://github.com/NVIDIA/nccl-tests.git
cd nccl-tests
                
# build with MPI enabled
make MPI=1 CUDA_HOME=/hpc/applications/nvidia/hpc_sdk/2021_21.9/Linux_x86_64/21.9/cuda/11.4/

