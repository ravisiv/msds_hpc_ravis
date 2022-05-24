FROM ubuntu
MAINTAINER rsivaraman@smu.edu
RUN apt-get update && apt-get install -y curl
RUN mkdir -p /opt/hpc_run
COPY assignment_04.sh /opt/hpc_run
RUN chmod -R +x /opt/hpc_run/assignment_04.sh
WORKDIR /opt/hpc_run
RUN /opt/hpc_run/assignment_04.sh
ENTRYPOINT ["tail", "-f", "/dev/null"]
