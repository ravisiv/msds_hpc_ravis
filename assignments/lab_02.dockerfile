# Build stage with Spack pre-installed and ready to be used
FROM spack/ubuntu-bionic:latest as builder


# What we want to install and how we want to install it
# is specified in a manifest file (spack.yaml)
RUN mkdir /opt/spack-environment \
&&  (echo "spack:" \
&&   echo "  config:" \
&&   echo "    install_missing_compilers: true" \
&&   echo "    install_tree: /opt/software" \
&&   echo "  view: /opt/view" \
&&   echo "  definitions:" \
&&   echo "  - compilers:" \
&&   echo "    - gcc@11.2.0" \
&&   echo "  - packages:" \
&&   echo "    - openblas threads=openmp" \
&&   echo "    - python@3.8.12" \
&&   echo "    - py-numpy+blas+lapack" \
&&   echo "  - targets:" \
&&   echo "    - target=broadwell" \
&&   echo "  specs:" \
&&   echo "  - matrix:" \
&&   echo "    - - $%compilers" \
&&   echo "    - - $packages" \
&&   echo "    - - $targets" \
&&   echo "  - py-pandas" \
&&   echo "  - py-matplotlib" \
&&   echo "  concretization: together") > /opt/spack-environment/spack.yaml

# Install the software, remove unnecessary deps
RUN cd /opt/spack-environment && \
    spack env activate . && \
    spack install --fail-fast && \
    spack gc -y

# Strip all the binaries
RUN find -L /opt/view/* -type f -exec readlink -f '{}' \; | \
    xargs file -i | \
    grep 'charset=binary' | \
    grep 'x-executable\|x-archive\|x-sharedlib' | \
    awk -F: '{print $1}' | xargs strip -s

# Modifications to the environment that are necessary to run
RUN cd /opt/spack-environment && \
    spack env activate --sh -d . >> /etc/profile.d/z10_spack_environment.sh

# Bare OS image to run the installed executables
FROM ubuntu:18.04

COPY --from=builder /opt/spack-environment /opt/spack-environment
COPY --from=builder /opt/software /opt/software
COPY --from=builder /opt/view /opt/view
COPY --from=builder /etc/profile.d/z10_spack_environment.sh /etc/profile.d/z10_spack_environment.sh

RUN mkdir -p /opt/hpc_run
COPY assignment_04.sh /opt/hpc_run
RUN chmod -R +x /opt/hpc_run/assignment_04.sh
WORKDIR /opt/hpc_run
RUN /opt/hpc_run/assignment_04.sh


ENTRYPOINT ["/bin/bash", "--rcfile", "/etc/profile", "-l"]

